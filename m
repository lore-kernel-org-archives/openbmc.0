Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbQK3S4PzDqmD
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:31:05 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467329460638453.46416813731844;
 Thu, 30 Jun 2016 16:31:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2 3/3] flash_bmc: Add Apply method to flash updates
 from runtime
Date: Thu, 30 Jun 2016 18:30:55 -0500
Message-Id: <20160630233055.16526-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630233055.16526-1-openbmc-patches@stwcx.xyz>
References: <20160630233055.16526-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 23:31:06 -0000

From: Milton Miller <miltonm@us.ibm.com>

This commit adds methods to Validate (not exposed), Apply,
GetUpdateProgress, and Abort along with an auto_apply attribute.

A PrepareForUpdate method is also added that will write bootloader
environment to instruct the initramfs init script to copy necessary
file system state into RAM to allow the flash to be updated.

Together these methods take the prior Update method and chain
on the Validate phase which checks the image can be applied
concurrently (and could be extended to check signatures).  If
validation fails auto_apply is cleared.   If auto_apply remains
true then Apply is called which will perform the check again
(implicitly in the update script) and update the flash contents,
saving its output to a temporary file.

The GetUpdateProgress will return the status variable followed
by the output from the update script, with status that was
overwritten with a carriage return stripped.  As each new phase
(erase, write, and verify) of each image is encountered the
message will be extended.

An Abort method will kill an in-progress update, erase the logfile,
and remove any pending images.  A new image can be unpacked at this
time.

Note: the current method to clear all persistent files removes the
whitelist and all future calls will clear all files from the read
write layer.  This maybe addressed in a future update.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 pyflashbmc/bmc_update.py | 163 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 154 insertions(+), 9 deletions(-)

diff --git a/pyflashbmc/bmc_update.py b/pyflashbmc/bmc_update.py
index 50042c1..8e3d43d 100644
--- a/pyflashbmc/bmc_update.py
+++ b/pyflashbmc/bmc_update.py
@@ -4,6 +4,8 @@ import gobject
 import dbus
 import dbus.service
 import dbus.mainloop.glib
+import subprocess
+import tempfile
 import shutil
 import tarfile
 import os
@@ -14,6 +16,9 @@ OBJ_NAME = '/org/openbmc/control/flash/bmc'
 FLASH_INTF = 'org.openbmc.Flash'
 DOWNLOAD_INTF = 'org.openbmc.managers.Download'
 
+BMC_DBUS_NAME = 'org.openbmc.control.Bmc'
+BMC_OBJ_NAME = '/org/openbmc/control/bmc0'
+
 UPDATE_PATH = '/run/initramfs'
 
 
@@ -36,19 +41,23 @@ class BmcFlashControl(DbusProperties,DbusObjectManager):
 		self.Set(DBUS_NAME,"restore_application_defaults",False)
 		self.Set(DBUS_NAME,"update_kernel_and_apps",False)
 		self.Set(DBUS_NAME,"clear_persistent_files",False)
-	
+		self.Set(DBUS_NAME,"auto_apply",False)
+
 		bus.add_signal_receiver(self.download_error_handler,signal_name = "DownloadError")
 		bus.add_signal_receiver(self.download_complete_handler,signal_name = "DownloadComplete")
 
+		self.update_process = None
+		self.progress_name = None
+
 		self.InterfacesAdded(name,self.properties)
 
 
 	@dbus.service.method(DBUS_NAME,
 		in_signature='ss', out_signature='')
 	def updateViaTftp(self,ip,filename):
-		self.TftpDownload(ip,filename)
 		self.Set(DBUS_NAME,"status","Downloading")
-		
+		self.TftpDownload(ip,filename)
+
 	@dbus.service.method(DBUS_NAME,
 		in_signature='s', out_signature='')
 	def update(self,filename):
@@ -101,7 +110,7 @@ class BmcFlashControl(DbusProperties,DbusObjectManager):
 
 		except Exception as e:
 			print e
-			self.Set(DBUS_NAME,"status","Update Error")
+			self.Set(DBUS_NAME,"status","Unpack Error")
 			return
 
 		try:
@@ -138,12 +147,148 @@ class BmcFlashControl(DbusProperties,DbusObjectManager):
 				
 		except Exception as e:
 			print e
-			self.Set(DBUS_NAME,"status","Update Error")
-				
-		
+			self.Set(DBUS_NAME,"status","Unpack Error")
+
+		self.Verify()
+
+	def Verify(self):
+		self.Set(DBUS_NAME,"status","Checking Image")
+		try:
+			subprocess.check_call([
+				"/run/initramfs/update",
+				"--no-flash",
+				"--no-save-files",
+				"--no-restore-files",
+				"--no-clean-saved-files" ])
+
+			self.Set(DBUS_NAME,"status","Image ready to apply.")
+			if (self.Get(DBUS_NAME,"auto_apply")):
+				self.Apply()
+		except:
+			self.Set(DBUS_NAME,"auto_apply",False)
+			try:
+				subprocess.check_output([
+					"/run/initramfs/update",
+					"--no-flash",
+					"--ignore-mount",
+					"--no-save-files",
+					"--no-restore-files",
+					"--no-clean-saved-files" ],
+					stderr = subprocess.STDOUT)
+				self.Set(DBUS_NAME,"status","Deferred for mounted filesystem. reboot BMC to apply.")
+			except subprocess.CalledProcessError as e:
+				self.Set(DBUS_NAME,"status","Verify error: %s"
+					%  e.output)
+			except OSError as e:
+				self.Set(DBUS_NAME,"status","Verify error: problem calling update: %s" %  e.strerror)
+
+
+	def Cleanup(self):
+		if self.progress_name:
+			try:
+				os.unlink(self.progress_name)
+				self.progress_name = None
+			except oserror as e:
+				if e.errno == EEXIST:
+					pass
+				raise
+		self.update_process = None
+		self.Set(DBUS_NAME,"status","Idle")
+
+	@dbus.service.method(DBUS_NAME,
+		in_signature='', out_signature='')
+	def Abort(self):
+		if self.update_process:
+			try:
+				self.update_process.kill()
+			except:
+				pass
+		for file in os.listdir(UPDATE_PATH):
+			if file.startswith('image-'):
+				os.unlink(os.path.join(UPDATE_PATH,file))
+
+		self.Cleanup();
+
+	@dbus.service.method(DBUS_NAME,
+		in_signature='', out_signature='s')
+	def GetUpdateProgress(self):
+		msg = ""
+
+		if self.update_process and self.update_process.returncode is None:
+			self.update_process.poll()
+
+		if (self.update_process is None):
+			pass
+		elif (self.update_process.returncode > 0):
+			self.Set(DBUS_NAME,"status","Apply failed")
+		elif (self.update_process.returncode is None):
+			pass
+		else:			# (self.update_process.returncode == 0)
+			files = ""
+			for file in os.listdir(UPDATE_PATH):
+				if file.startswith('image-'):
+					files = files + file;
+			if files == "":
+				msg = "Apply Complete.  Reboot to take effect."
+			else:
+				msg = "Apply Incomplete, Remaining:" + files
+			self.Set(DBUS_NAME,"status", msg)
+
+		msg = self.Get(DBUS_NAME,"status") + "\n";
+		if self.progress_name:
+			try:
+				prog = open(self.progress_name,'r')
+				for line in prog:
+					# strip off initial sets of xxx\r here
+					# ignore crlf at the end
+					# cr will be -1 if no '\r' is found
+					cr = line.rfind("\r", 0, -2)
+					msg = msg + line[cr + 1: ]
+			except OSError as e:
+				if (e.error == EEXIST):
+					pass
+				raise
+		return msg
+
+	@dbus.service.method(DBUS_NAME,
+		in_signature='', out_signature='')
+	def Apply(self):
+		progress = None
+		self.Set(DBUS_NAME,"status","Writing images to flash")
+		try:
+			progress = tempfile.NamedTemporaryFile(
+				delete = False, prefix="progress." )
+			self.progress_name = progress.name
+			self.update_process = subprocess.Popen([
+				"/run/initramfs/update" ],
+				stdout = progress.file,
+				stderr = subprocess.STDOUT )
+		except Exception as e:
+			try:
+				progress.close()
+				os.unlink(progress.name)
+				self.progress_name = None
+			except:
+				pass
+			raise
+
+		try:
+			progress.close()
+		except:
+			pass
+
+	@dbus.service.method(DBUS_NAME,
+		in_signature='', out_signature='')
+	def PrepareForUpdate(self):
+		subprocess.call([
+			"fw_setenv",
+			"openbmconce",
+			"copy-files-to-ram copy-base-filesystem-to-ram"])
+		self.Set(DBUS_NAME,"status","Switch to update mode in progress")
+		o = bus.get_object(BMC_DBUS_NAME, BMC_OBJ_NAME)
+		intf = dbus.Interface(o, BMC_DBUS_NAME)
+		intf.warmReset()
 
-		self.Set(DBUS_NAME,"status","Update Success.  Please reboot.")
-		
 
 if __name__ == '__main__':
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
-- 
2.9.0
