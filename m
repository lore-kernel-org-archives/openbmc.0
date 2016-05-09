Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3HF14bwwzDq5m
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 19:31:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462786256919525.0676470049656;
 Mon, 9 May 2016 02:30:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton v7 01/21] add i2craw tool and hdd status function
Date: Mon,  9 May 2016 04:30:34 -0500
Message-Id: <1462786254-18000-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 May 2016 09:31:02 -0000

From: Ken <ken1029@gmail.com>

---
 Makefile                   |  13 +-
 bin/Barreleye.py           |   6 +
 bin/chassis_control.py     |   7 +-
 bin/startup_hacks.sh       |   8 +
 objects/button_power_obj.c |  17 ++-
 objects/i2c-dev.h          | 362 +++++++++++++++++++++++++++++++++++++++++++++
 objects/i2craw.c           | 245 ++++++++++++++++++++++++++++++
 objects/info.c             | 355 ++++++++++++++++++++++++++++++++++++++++++++
 objects/log.h              |  59 ++++++++
 9 files changed, 1059 insertions(+), 13 deletions(-)
 create mode 100644 objects/i2c-dev.h
 create mode 100644 objects/i2craw.c
 create mode 100644 objects/info.c
 create mode 100644 objects/log.h

diff --git a/Makefile b/Makefile
index 8a88a37..3b8a2ae 100755
--- a/Makefile
+++ b/Makefile
@@ -9,6 +9,11 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 INCLUDES += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
 LIB_FLAG += $(shell pkg-config  --libs libsystemd)
 
+DEPPKGS = libsystemd
+INCLUDES_info += $(shell pkg-config --cflags $(DEPPKGS))
+LIBS_info += $(shell pkg-config --libs $(DEPPKGS))
+
+
 %.o: interfaces/%.c 
 	$(CC) -c -fPIC -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
@@ -24,7 +29,7 @@ LIB_FLAG += $(shell pkg-config  --libs libsystemd)
 %.o: objects/pflash/libflash/%.c
 	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
-all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios flasher pflash hwmons_barreleye control_bmc
+all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios flasher pflash hwmons_barreleye control_bmc i2craw info
 
 setup: 
 	mkdir -p obj lib
@@ -69,6 +74,12 @@ flasher:  $(OBJS2) flasher_obj.o libopenbmc_intf
 pflash:  $(OBJS2) pflash.o
 	$(CC) -o bin/$@ obj/pflash.o $(OBJS3) $(LDFLAGS)
 
+i2craw:  $(OBJS2) i2craw.o
+	$(CC) -o bin/$@ obj/i2craw.o $(LDFLAGS)
+
+info:   info.o
+	$(CC) -o bin/$@ obj/info.o $(LDFLAGS) $(LIBS_info)
+
 hwmons_barreleye: hwmons_barreleye.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/hwmons_barreleye.o obj/object_mapper.o  $(LDFLAGS) $(LIBS)
 
diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 09fefa0..08a91a9 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -210,6 +210,12 @@ APPS = {
 		'monitor_process' : False,
 		'process_name'    : 'discover_system_state.py',
 	},
+        'info' : {
+                'system_state'    : 'BMC_STARTING2',
+                'start_process'   : True,
+                'monitor_process' : True,
+                'process_name'    : 'info',
+        },
 	'bmc_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 334fbbf..cd8a98d 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -76,9 +76,6 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		bus.add_signal_receiver(self.power_button_signal_handler, 
 					dbus_interface = "org.openbmc.Button", signal_name = "Released", 
 					path="/org/openbmc/buttons/power0" )
-		bus.add_signal_receiver(self.reset_button_signal_handler, 
-					dbus_interface = "org.openbmc.Button", signal_name = "PressedLong", 
-					path="/org/openbmc/buttons/power0" )
 		bus.add_signal_receiver(self.softreset_button_signal_handler, 
 					dbus_interface = "org.openbmc.Button", signal_name = "Released", 
 					path="/org/openbmc/buttons/reset0" )
@@ -154,7 +151,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 	def reboot(self):
 		print "Rebooting"
 		if self.getPowerState() == POWER_OFF:
-			self.powerOn();
+			print "Power off, no reboot."
 		else:
 			self.Set(DBUS_NAME,"reboot",1)
 			self.powerOff()
@@ -199,7 +196,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		self.reboot();
 
 	def softreset_button_signal_handler(self):
-		self.softReboot();
+		self.reboot();
 		
 	def host_watchdog_signal_handler(self):
 		print "Watchdog Error, Hard Rebooting"
diff --git a/bin/startup_hacks.sh b/bin/startup_hacks.sh
index 3a93e90..cf3632a 100755
--- a/bin/startup_hacks.sh
+++ b/bin/startup_hacks.sh
@@ -2,6 +2,14 @@
 
 systemctl stop serial-getty@ttyS0
 
+# Set to output pin
+ i2cset -y 0x06 0x20 0x06 0x00
+ i2cset -y 0x06 0x20 0x07 0x00
+ 
+ # Turn on all fan LED to BLUE
+ i2cset -y 0x06 0x20 0x03 0x55
+ i2cset -y 0x06 0x20 0x02 0xaa
+
 # Setup VUART
 VUART=/sys/devices/platform/ahb/ahb:apb/1e787000.vuart
 echo 4 > $VUART/sirq
diff --git a/objects/button_power_obj.c b/objects/button_power_obj.c
index 94f8922..57881b2 100644
--- a/objects/button_power_obj.c
+++ b/objects/button_power_obj.c
@@ -1,4 +1,5 @@
 #include <stdio.h>
+#include <stdlib.h>
 #include "interfaces/openbmc_intf.h"
 #include "gpio.h"
 #include "openbmc.h"
@@ -42,7 +43,10 @@ on_button_interrupt( GIOChannel *channel,
 
 	GError *error = 0;
 	gsize bytes_read = 0;
-	gchar buf[2]; 
+	gchar buf[2];
+ 
+ 	uint8_t val;
+ 	int rc1 = GPIO_OK;
 	buf[1] = '\0';
 	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
 	GIOStatus rc = g_io_channel_read_chars( channel,
@@ -65,12 +69,11 @@ on_button_interrupt( GIOChannel *channel,
 		{
 			long press_time = current_time-button_get_timer(button);
 			printf("Power Button released, held for %ld seconds\n",press_time);
-			if (press_time > LONG_PRESS_SECONDS)
-			{
-				button_emit_pressed_long(button);
-			} else {
-				button_emit_released(button);
-			}
+			rc1 =  gpio_open(&gpio_button);
+			rc1 = gpio_read(&gpio_button,&val);
+			if (val == 1)
+			button_emit_released(button);
+
 		}
 	} 
 	else { gpio_button.irq_inited = true; }
diff --git a/objects/i2c-dev.h b/objects/i2c-dev.h
new file mode 100644
index 0000000..eefb6e4
--- /dev/null
+++ b/objects/i2c-dev.h
@@ -0,0 +1,362 @@
+/*
+    i2c-dev.h - i2c-bus driver, char device interface
+
+    Copyright (C) 1995-97 Simon G. Vogl
+    Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+    MA 02110-1301 USA.
+*/
+
+#ifndef _LINUX_I2C_DEV_H
+#define _LINUX_I2C_DEV_H
+
+#include <linux/types.h>
+#include <sys/ioctl.h>
+#include <stddef.h>
+#include <string.h>
+
+
+/* -- i2c.h -- */
+
+#define _I2C_MIN(a, b) (((a) <= (b)) ? (a) : (b))
+
+/*
+ * I2C Message - used for pure i2c transaction, also from /dev interface
+ */
+struct i2c_msg {
+	__u16 addr;	/* slave address			*/
+	unsigned short flags;
+#define I2C_CLIENT_PEC	0x04		/* Use Packet Error Checking */
+#define I2C_M_TEN		0x0010	/* this is a ten bit chip address */
+#define I2C_M_RD		0x0001	/* read data, from slave to master */
+#define I2C_M_NOSTART		0x4000	/* if I2C_FUNC_PROTOCOL_MANGLING */
+#define I2C_M_REV_DIR_ADDR	0x2000	/* if I2C_FUNC_PROTOCOL_MANGLING */
+#define I2C_M_IGNORE_NAK	0x1000	/* if I2C_FUNC_PROTOCOL_MANGLING */
+#define I2C_M_NO_RD_ACK		0x0800	/* if I2C_FUNC_PROTOCOL_MANGLING */
+#define I2C_M_RECV_LEN		0x0400	/* length will be first received byte */
+	short len;		/* msg length				*/
+	char *buf;		/* pointer to msg data			*/
+};
+
+/* To determine what functionality is present */
+
+#define I2C_FUNC_I2C			0x00000001
+#define I2C_FUNC_10BIT_ADDR		0x00000002
+#define I2C_FUNC_PROTOCOL_MANGLING	0x00000004 /* I2C_M_{REV_DIR_ADDR,NOSTART,..} */
+#define I2C_FUNC_SMBUS_PEC		0x00000008
+#define I2C_FUNC_SMBUS_BLOCK_PROC_CALL	0x00008000 /* SMBus 2.0 */
+#define I2C_FUNC_SMBUS_QUICK		0x00010000
+#define I2C_FUNC_SMBUS_READ_BYTE	0x00020000
+#define I2C_FUNC_SMBUS_WRITE_BYTE	0x00040000
+#define I2C_FUNC_SMBUS_READ_BYTE_DATA	0x00080000
+#define I2C_FUNC_SMBUS_WRITE_BYTE_DATA	0x00100000
+#define I2C_FUNC_SMBUS_READ_WORD_DATA	0x00200000
+#define I2C_FUNC_SMBUS_WRITE_WORD_DATA	0x00400000
+#define I2C_FUNC_SMBUS_PROC_CALL	0x00800000
+#define I2C_FUNC_SMBUS_READ_BLOCK_DATA	0x01000000
+#define I2C_FUNC_SMBUS_WRITE_BLOCK_DATA 0x02000000
+#define I2C_FUNC_SMBUS_READ_I2C_BLOCK	0x04000000 /* I2C-like block xfer  */
+#define I2C_FUNC_SMBUS_WRITE_I2C_BLOCK	0x08000000 /* w/ 1-byte reg. addr. */
+
+#define I2C_FUNC_SMBUS_BYTE (I2C_FUNC_SMBUS_READ_BYTE | \
+                             I2C_FUNC_SMBUS_WRITE_BYTE)
+#define I2C_FUNC_SMBUS_BYTE_DATA (I2C_FUNC_SMBUS_READ_BYTE_DATA | \
+                                  I2C_FUNC_SMBUS_WRITE_BYTE_DATA)
+#define I2C_FUNC_SMBUS_WORD_DATA (I2C_FUNC_SMBUS_READ_WORD_DATA | \
+                                  I2C_FUNC_SMBUS_WRITE_WORD_DATA)
+#define I2C_FUNC_SMBUS_BLOCK_DATA (I2C_FUNC_SMBUS_READ_BLOCK_DATA | \
+                                   I2C_FUNC_SMBUS_WRITE_BLOCK_DATA)
+#define I2C_FUNC_SMBUS_I2C_BLOCK (I2C_FUNC_SMBUS_READ_I2C_BLOCK | \
+                                  I2C_FUNC_SMBUS_WRITE_I2C_BLOCK)
+
+/* Old name, for compatibility */
+#define I2C_FUNC_SMBUS_HWPEC_CALC	I2C_FUNC_SMBUS_PEC
+
+/*
+ * Data for SMBus Messages
+ */
+#define I2C_SMBUS_BLOCK_MAX	32	/* As specified in SMBus standard */
+#define I2C_SMBUS_I2C_BLOCK_MAX	32	/* Not specified but we use same structure */
+union i2c_smbus_data {
+	__u8 byte;
+	__u16 word;
+	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for length */
+	                                            /* and one more for PEC */
+};
+
+#define I2C_SMBUS_BLOCK_LARGE_MAX	240
+union i2c_smbus_large_data {
+  union i2c_smbus_data data;
+  __u8 block[I2C_SMBUS_BLOCK_LARGE_MAX + 2]; /* block[0] is used for length */
+                                             /* and one more for PEC */
+};
+
+/* smbus_access read or write markers */
+#define I2C_SMBUS_READ	1
+#define I2C_SMBUS_WRITE	0
+
+/* SMBus transaction types (size parameter in the above functions)
+   Note: these no longer correspond to the (arbitrary) PIIX4 internal codes! */
+#define I2C_SMBUS_QUICK		    0
+#define I2C_SMBUS_BYTE		    1
+#define I2C_SMBUS_BYTE_DATA	    2
+#define I2C_SMBUS_WORD_DATA	    3
+#define I2C_SMBUS_PROC_CALL	    4
+#define I2C_SMBUS_BLOCK_DATA	    5
+#define I2C_SMBUS_I2C_BLOCK_BROKEN  6
+#define I2C_SMBUS_BLOCK_PROC_CALL   7		/* SMBus 2.0 */
+#define I2C_SMBUS_I2C_BLOCK_DATA    8
+#define I2C_SMBUS_BLOCK_LARGE_DATA    9
+
+
+/* /dev/i2c-X ioctl commands.  The ioctl's parameter is always an
+ * unsigned long, except for:
+ *	- I2C_FUNCS, takes pointer to an unsigned long
+ *	- I2C_RDWR, takes pointer to struct i2c_rdwr_ioctl_data
+ *	- I2C_SMBUS, takes pointer to struct i2c_smbus_ioctl_data
+ */
+#define I2C_RETRIES	0x0701	/* number of times a device address should
+				   be polled when not acknowledging */
+#define I2C_TIMEOUT	0x0702	/* set timeout in units of 10 ms */
+
+/* NOTE: Slave address is 7 or 10 bits, but 10-bit addresses
+ * are NOT supported! (due to code brokenness)
+ */
+#define I2C_SLAVE	0x0703	/* Use this slave address */
+#define I2C_SLAVE_FORCE	0x0706	/* Use this slave address, even if it
+				   is already in use by a driver! */
+#define I2C_TENBIT	0x0704	/* 0 for 7 bit addrs, != 0 for 10 bit */
+
+#define I2C_FUNCS	0x0705	/* Get the adapter functionality mask */
+
+#define I2C_RDWR	0x0707	/* Combined R/W transfer (one STOP only) */
+
+#define I2C_PEC		0x0708	/* != 0 to use PEC with SMBus */
+#define I2C_SMBUS	0x0720	/* SMBus transfer */
+
+
+/* This is the structure as used in the I2C_SMBUS ioctl call */
+struct i2c_smbus_ioctl_data {
+	__u8 read_write;
+	__u8 command;
+	__u32 size;
+	union i2c_smbus_data *data;
+};
+
+/* This is the structure as used in the I2C_RDWR ioctl call */
+struct i2c_rdwr_ioctl_data {
+	struct i2c_msg *msgs;	/* pointers to i2c_msgs */
+	__u32 nmsgs;			/* number of i2c_msgs */
+};
+
+#define  I2C_RDRW_IOCTL_MAX_MSGS	42
+
+
+static inline __s32 i2c_smbus_access(int file, char read_write, __u8 command,
+                                     int size, union i2c_smbus_data *data)
+{
+	struct i2c_smbus_ioctl_data args;
+
+	args.read_write = read_write;
+	args.command = command;
+	args.size = size;
+	args.data = data;
+	return ioctl(file,I2C_SMBUS,&args);
+}
+
+
+static inline __s32 i2c_smbus_write_quick(int file, __u8 value)
+{
+	return i2c_smbus_access(file,value,0,I2C_SMBUS_QUICK,NULL);
+}
+
+static inline __s32 i2c_smbus_read_byte(int file)
+{
+	union i2c_smbus_data data;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,0,I2C_SMBUS_BYTE,&data))
+		return -1;
+	else
+		return 0x0FF & data.byte;
+}
+
+static inline __s32 i2c_smbus_write_byte(int file, __u8 value)
+{
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,value,
+	                        I2C_SMBUS_BYTE,NULL);
+}
+
+static inline __s32 i2c_smbus_read_byte_data(int file, __u8 command)
+{
+	union i2c_smbus_data data;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,command,
+	                     I2C_SMBUS_BYTE_DATA,&data))
+		return -1;
+	else
+		return 0x0FF & data.byte;
+}
+
+static inline __s32 i2c_smbus_write_byte_data(int file, __u8 command,
+                                              __u8 value)
+{
+	union i2c_smbus_data data;
+	data.byte = value;
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                        I2C_SMBUS_BYTE_DATA, &data);
+}
+
+static inline __s32 i2c_smbus_read_word_data(int file, __u8 command)
+{
+	union i2c_smbus_data data;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,command,
+	                     I2C_SMBUS_WORD_DATA,&data))
+		return -1;
+	else
+		return 0x0FFFF & data.word;
+}
+
+static inline __s32 i2c_smbus_write_word_data(int file, __u8 command,
+                                              __u16 value)
+{
+	union i2c_smbus_data data;
+	data.word = value;
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                        I2C_SMBUS_WORD_DATA, &data);
+}
+
+static inline __s32 i2c_smbus_process_call(int file, __u8 command, __u16 value)
+{
+	union i2c_smbus_data data;
+	data.word = value;
+	if (i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                     I2C_SMBUS_PROC_CALL,&data))
+		return -1;
+	else
+		return 0x0FFFF & data.word;
+}
+
+
+/* Returns the number of read bytes */
+static inline __s32 i2c_smbus_read_block_data(int file, __u8 command,
+                                              __u8 *values)
+{
+	union i2c_smbus_data data;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,command,
+	                     I2C_SMBUS_BLOCK_DATA,&data))
+		return -1;
+	else {
+		memcpy(values, &data.block[1], _I2C_MIN(data.block[0], I2C_SMBUS_BLOCK_MAX));
+		return data.block[0];
+	}
+}
+
+static inline __s32 i2c_smbus_write_block_data(int file, __u8 command,
+                                               __u8 length, const __u8 *values)
+{
+	union i2c_smbus_data data;
+	if (length > 32)
+		length = 32;
+	memcpy(&data.block[1], values, length);
+	data.block[0] = length;
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                        I2C_SMBUS_BLOCK_DATA, &data);
+}
+
+static inline __s32 i2c_smbus_read_block_large_data(int file, __u8 command,
+                                                    __u8 *values)
+{
+  union i2c_smbus_large_data data;
+  if (i2c_smbus_access(file, I2C_SMBUS_READ, command,
+                       I2C_SMBUS_BLOCK_LARGE_DATA,
+                       (union i2c_smbus_data *)&data)) {
+    return -1;
+  } else {
+    /* the first byte is the length which is not copied */
+    memcpy(values, &data.block[1], _I2C_MIN(data.block[0], I2C_SMBUS_BLOCK_LARGE_MAX));
+    return data.block[0];
+  }
+}
+
+static inline __s32 i2c_smbus_write_block_large_data(int file, __u8 command,
+                                                     __u8 length,
+                                                     const __u8 *values)
+{
+  union i2c_smbus_large_data data;
+  if (length > I2C_SMBUS_BLOCK_LARGE_MAX) {
+    length = I2C_SMBUS_BLOCK_LARGE_MAX;
+  }
+  data.block[0] = length;
+  memcpy(&data.block[1], values, length);
+  return i2c_smbus_access(file, I2C_SMBUS_WRITE, command,
+                          I2C_SMBUS_BLOCK_LARGE_DATA,
+                          (union i2c_smbus_data *)&data);
+}
+
+/* Returns the number of read bytes */
+/* Until kernel 2.6.22, the length is hardcoded to 32 bytes. If you
+   ask for less than 32 bytes, your code will only work with kernels
+   2.6.23 and later. */
+static inline __s32 i2c_smbus_read_i2c_block_data(int file, __u8 command,
+                                                  __u8 length, __u8 *values)
+{
+	union i2c_smbus_data data;
+
+	if (length > 32)
+		length = 32;
+	data.block[0] = length;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,command,
+	                     length == 32 ? I2C_SMBUS_I2C_BLOCK_BROKEN :
+	                      I2C_SMBUS_I2C_BLOCK_DATA,&data))
+		return -1;
+	else {
+		memcpy(values, &data.block[1], _I2C_MIN(data.block[0], I2C_SMBUS_BLOCK_MAX));
+		return data.block[0];
+	}
+}
+
+static inline __s32 i2c_smbus_write_i2c_block_data(int file, __u8 command,
+                                                   __u8 length,
+                                                   const __u8 *values)
+{
+	union i2c_smbus_data data;
+	if (length > 32)
+		length = 32;
+	memcpy(&data.block[1], values, length);
+	data.block[0] = length;
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                        I2C_SMBUS_I2C_BLOCK_BROKEN, &data);
+}
+
+/* Returns the number of read bytes */
+static inline __s32 i2c_smbus_block_process_call(int file, __u8 command,
+                                                 __u8 length, __u8 *values)
+{
+	union i2c_smbus_data data;
+	if (length > 32)
+		length = 32;
+	memcpy(&data.block[1], values, length);
+	data.block[0] = length;
+	if (i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                     I2C_SMBUS_BLOCK_PROC_CALL,&data))
+		return -1;
+	else {
+		memcpy(values, &data.block[1], _I2C_MIN(data.block[0], I2C_SMBUS_BLOCK_MAX));
+		return data.block[0];
+	}
+}
+
+#undef _I2C_MIN
+
+#endif /* _LINUX_I2C_DEV_H */
diff --git a/objects/i2craw.c b/objects/i2craw.c
new file mode 100644
index 0000000..a74cc49
--- /dev/null
+++ b/objects/i2craw.c
@@ -0,0 +1,245 @@
+/*
+ * Copyright 2004-present Facebook. All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <stdint.h>
+
+#include "i2c-dev.h"
+#include "log.h"
+
+void usage(const char *prog) {
+  printf("Usage: %s [options] <bus number> <slave address>\n", prog);
+  printf("\n  Options:\n"
+         "\n\t-w 'bytes to write':\n"
+         "\t\t i2c write\n"
+         "\n\t-r <number of bytes to read>:\n"
+         "\t\t if 0 is provided, the first byte of read is used to determine\n"
+         "\t\t how many bytes more to read\n"
+         "\n\t-p:\n"
+         "\t\t Use PEC\n"
+         "\n\t-h:\n"
+         "\t\t Print this help\n"
+         "\n  Note: if both '-w' and '-r' are specified, write will be"
+         "\n        performed first, followed by read\n");
+}
+
+#define MAX_BYTES 255
+
+int g_use_pec = 0;
+int g_has_write = 0;
+int g_n_write = 0;
+uint8_t g_write_bytes[MAX_BYTES];
+int g_has_read = 0;
+int g_n_read = -1;
+uint8_t g_read_bytes[MAX_BYTES];
+uint8_t g_bus = -1;
+uint8_t g_slave_addr = 0xff;
+
+static int parse_byte_string(const char *str) {
+  const char *startptr = str;
+  char *endptr;
+  int total = 0;
+  unsigned long val;
+
+  do {
+    val = strtoul(startptr, &endptr, 0);
+    if (startptr == endptr) {
+      printf("'%s' is invalid\n", str);
+      return -1;
+    }
+    if (val > MAX_BYTES) {
+      printf("'%s' is invalid\n", str);
+      return -1;
+    }
+    g_write_bytes[total++] = val;
+    if (*endptr == '\0') {
+      break;
+    }
+    if (total >= MAX_BYTES) {
+      printf("'%s' is invalid\n", str);
+      return -1;
+    }
+    startptr = endptr;
+  } while(1);
+
+  return total;
+}
+
+static int i2c_open() {
+  int fd;
+  char fn[32];
+  int rc;
+
+  snprintf(fn, sizeof(fn), "/dev/i2c-%d", g_bus);
+  fd = open(fn, O_RDWR);
+  if (fd == -1) {
+    LOG_ERR(errno, "Failed to open i2c device %s", fn);
+    return -1;
+  }
+
+  rc = ioctl(fd, I2C_SLAVE, g_slave_addr);
+  if (rc < 0) {
+    LOG_ERR(errno, "Failed to open slave @ address 0x%x", g_slave_addr);
+    close(fd);
+  }
+
+  return fd;
+}
+
+static int i2c_io(int fd) {
+  struct i2c_rdwr_ioctl_data data;
+  struct i2c_msg msg[2];
+  int n_msg = 0;
+  int rc;
+
+  memset(&msg, 0, sizeof(msg));
+
+  if (g_has_write) {
+    msg[n_msg].addr = g_slave_addr;
+    msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
+    msg[n_msg].len = g_n_write;
+    msg[n_msg].buf = g_write_bytes;
+    n_msg++;
+  }
+
+  if (g_has_read) {
+    msg[n_msg].addr = g_slave_addr;
+    msg[n_msg].flags = I2C_M_RD
+      | ((g_use_pec) ? I2C_CLIENT_PEC : 0)
+      | ((g_n_read == 0) ? I2C_M_RECV_LEN : 0);
+    /*
+     * In case of g_n_read is 0, block length will be added by
+     * the underlying bus driver.
+     */
+    msg[n_msg].len = (g_n_read) ? g_n_read : 256;
+    msg[n_msg].buf = g_read_bytes;
+    if (g_n_read == 0) {
+      /* If we're using variable length block reads, we have to set the
+       * first byte of the buffer to at least one or the kernel complains.
+       */
+      g_read_bytes[0] = 1;
+    }
+    n_msg++;
+  }
+
+  data.msgs = msg;
+  data.nmsgs = n_msg;
+
+  rc = ioctl(fd, I2C_RDWR, &data);
+  if (rc < 0) {
+    LOG_ERR(errno, "Failed to do raw io");
+    return -1;
+  }
+
+  return 0;
+}
+
+int main(int argc, char * const argv[]) {
+  int i;
+  int fd;
+  int opt;
+  while ((opt = getopt(argc, argv, "hpw:r:")) != -1) {
+    switch (opt) {
+    case 'h':
+      usage(argv[0]);
+      return 0;
+    case 'p':
+      g_use_pec = 1;
+      break;
+    case 'w':
+      g_has_write = 1;
+      if ((g_n_write = parse_byte_string(optarg)) <= 0) {
+        usage(argv[0]);
+        return -1;
+      }
+      break;
+    case 'r':
+      g_has_read = 1;
+      g_n_read = atoi(optarg);
+      break;
+    default:
+      usage(argv[0]);
+      return -1;
+    }
+  }
+
+  /* make sure we still have arguments for bus and slave address */
+  if (optind + 2 != argc) {
+    printf("Bus or slave address is missing\n");
+    usage(argv[0]);
+    return -1;
+  }
+
+  g_bus = atoi(argv[optind]);
+  g_slave_addr = strtoul(argv[optind + 1], NULL, 0);
+  if ((g_slave_addr & 0x80)) {
+    printf("Slave address must be 7-bit\n");
+    return -1;
+  }
+
+  if (!g_has_write && !g_has_read) {
+    /* by default, read, first byte read is the length */
+    g_has_read = 1;
+    g_n_read = 0;
+  }
+
+  printf("Bus: %d\nDevice address: 0x%x\n", g_bus, g_slave_addr);
+  if (g_has_write) {
+    printf("To write %d bytes:", g_n_write);
+    for (i = 0; i < g_n_write; i++) {
+      printf(" 0x%x", g_write_bytes[i]);
+    }
+    printf("\n");
+  }
+  if (g_has_read) {
+    if (g_n_read) {
+      printf("To read %d bytes.\n", g_n_read);
+    } else {
+      printf("To read data.\n");
+    }
+  }
+
+  fd = i2c_open();
+  if (fd < 0) {
+    return -1;
+  }
+
+  if (i2c_io(fd) < 0) {
+    return -1;
+  }
+
+  if (g_has_read) {
+    printf("Received:\n ");
+    if (g_n_read == 0) {
+      g_n_read = g_read_bytes[0] + 1;
+    }
+    for (i = 0; i < g_n_read; i++) {
+      printf(" 0x%x", g_read_bytes[i]);
+    }
+    printf("\n");
+  }
+
+  return 0;
+}
diff --git a/objects/info.c b/objects/info.c
new file mode 100644
index 0000000..ab2d98c
--- /dev/null
+++ b/objects/info.c
@@ -0,0 +1,355 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <systemd/sd-bus.h>
+#include "i2c-dev.h"
+#include "log.h"
+
+const char *gService = "org.openbmc.Sensors";
+const char *gObjPath = "/org/openbmc/sensors/temperature/cpu0/core0";
+const char *gObjPath_o = "/org/openbmc/sensors/host/OccStatus";
+const char *gIntPath = "org.openbmc.SensorValue";
+
+const char *gService_c = "org.openbmc.control.Chassis";
+const char *gObjPath_c = "/org/openbmc/control/chassis0";
+const char *gIntPath_c = "org.openbmc.control.Chassis";
+//const char *chassis_iface = "org.openbmc.SensorValue";
+
+char *gMessage = NULL;
+sd_bus *bus = NULL;
+
+#define MAX_BYTES 255
+
+int g_use_pec = 0;
+int g_has_write = 1;
+int g_n_write = 0;
+uint8_t g_write_bytes[MAX_BYTES];
+int g_has_read = 1;
+int g_n_read = -1;
+uint8_t g_read_bytes[MAX_BYTES];
+uint8_t g_read_tmp[MAX_BYTES];
+uint8_t g_bus = -1;
+uint8_t g_slave_addr = 0xff;
+
+static int i2c_open() {
+  int fd;
+  char fn[32];
+  int rc;
+
+  g_bus = 6;
+  snprintf(fn, sizeof(fn), "/dev/i2c-%d", g_bus);
+  fd = open(fn, O_RDWR);
+  if (fd == -1) {
+    LOG_ERR(errno, "Failed to open i2c device %s", fn);
+    return -1;
+  }
+
+  g_slave_addr = 0x4f;
+  rc = ioctl(fd, I2C_SLAVE, g_slave_addr);
+  if (rc < 0) {
+    LOG_ERR(errno, "Failed to open slave @ address 0x%x", g_slave_addr);
+    close(fd);
+  }
+
+  return fd;
+}
+
+static int i2c_io(int fd) {
+  struct i2c_rdwr_ioctl_data data;
+  struct i2c_msg msg[2];
+  int n_msg = 0;
+  int rc;
+
+  memset(&msg, 0, sizeof(msg));
+
+  g_slave_addr = 0x5f;
+  g_use_pec = 0;
+  g_n_write = 3;
+  g_write_bytes[0] = 0xfc;
+  g_write_bytes[1] = 0x3;
+  g_write_bytes[2] = 0x0;
+  
+
+  g_n_read = 5;
+  
+
+  if (1) {
+    msg[n_msg].addr = g_slave_addr;
+    msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
+    msg[n_msg].len = g_n_write;
+    msg[n_msg].buf = g_write_bytes;
+    n_msg++;
+  }
+
+  if (1) {
+    msg[n_msg].addr = g_slave_addr;
+    msg[n_msg].flags = I2C_M_RD
+      | ((g_use_pec) ? I2C_CLIENT_PEC : 0)
+      | ((g_n_read == 0) ? I2C_M_RECV_LEN : 0);
+    /*
+     * In case of g_n_read is 0, block length will be added by
+     * the underlying bus driver.
+     */
+    msg[n_msg].len = (g_n_read) ? g_n_read : 256;
+    msg[n_msg].buf = g_read_bytes;
+    if (g_n_read == 0) {
+      /* If we're using variable length block reads, we have to set the
+       * first byte of the buffer to at least one or the kernel complains.
+       */
+      g_read_bytes[0] = 1;
+    }
+    n_msg++;
+  }
+
+  data.msgs = msg;
+  data.nmsgs = n_msg;
+
+  rc = ioctl(fd, I2C_RDWR, &data);
+  if (rc < 0) {
+    LOG_ERR(errno, "Failed to do raw io");
+    return -1;
+  }
+
+  return 0;
+}
+
+int get_hdd_status(void)
+{
+  int fd, i;
+  char *test;
+  test="Ken";
+  char str[10];
+  fd = i2c_open();
+  if (fd < 0) {
+    return -1;
+  }
+
+  if (i2c_io(fd) < 0) {
+    return -1;
+  }
+
+    //printf("Received:\n ");
+    if (g_n_read == 0) {
+      g_n_read = g_read_bytes[0] + 1;
+    }
+    for (i = 0; i < g_n_read; i++) {
+      //printf(" 0x%x", g_read_bytes[i]);
+    }
+    if ((g_read_tmp[2]!=g_read_bytes[2])||(g_read_tmp[3]!=g_read_bytes[3]))
+    {
+    sprintf(str, "HDD change:0x%x,0x%x", g_read_bytes[2], g_read_bytes[3]);
+   
+	send_esel_to_dbus(str, "Low", "assoc", "hack", 3);
+    }
+
+    g_read_tmp[2]=g_read_bytes[2];
+    g_read_tmp[3]=g_read_bytes[3];
+
+}
+
+int send_esel_to_dbus(const char *desc, const char *sev, const char *details, uint8_t *debug, size_t debuglen) {
+
+	sd_bus *mbus = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+    uint16_t x;
+    int r;
+	sd_bus_error_free(&error);
+
+	printf("add sel\n");
+ 	r = sd_bus_open_system(&mbus);
+	if (r < 0) {
+		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+		goto finish;
+	}
+
+    r = sd_bus_message_new_method_call(mbus,&m,
+    									"org.openbmc.records.events",
+    									"/org/openbmc/records/events",
+    									"org.openbmc.recordlog",
+    									"acceptHostMessage");
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
+        goto finish;
+    }
+
+    r = sd_bus_message_append(m, "sss", desc, sev, details);
+    if (r < 0) {
+        fprintf(stderr, "Failed add the message strings : %s\n", strerror(-r));
+        goto finish;
+    }
+
+    r = sd_bus_message_append_array(m, 'y', debug, debuglen);
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the raw array of bytes: %s\n", strerror(-r));
+        goto finish;
+    }
+    // Call the IPMI responder on the bus so the message can be sent to the CEC
+    r = sd_bus_call(mbus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION__, strerror(-r));
+        goto finish;
+    }
+    r = sd_bus_message_read(reply, "q", &x);
+    if (r < 0) {
+        fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
+    }
+
+finish:
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
+    return r;	
+}
+int start_system_information(void) {
+
+	sd_bus *bus;
+	sd_bus_slot *slot;
+	int r, x, rc,retry;
+	char *OccStatus;
+    r = -1;
+	while(r < 0) {
+	/* Connect to the user bus this time */
+	r = sd_bus_open_system(&bus);
+		if(r < 0){	
+			fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+		sleep(1);
+			}
+	//	goto finish;
+	
+		}
+	// SD Bus error report mechanism.
+	sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+	sd_bus_message *response = NULL, *m = NULL;;
+        sd_bus_error_free(&bus_error);
+        sd_bus_message_unref(response);
+//		send_esel_to_dbus("desc", "sev", "assoc", "hack", 3);
+
+while(1){
+       sd_bus_error_free(&bus_error);
+
+
+	   
+       rc = sd_bus_call_method(bus,                   // On the System Bus
+                                gService_c,               // Service to contact
+                                gObjPath_c,            // Object path
+                                gIntPath_c,              // Interface name
+                                "getPowerState",          // Method to be called
+                                &bus_error,                 // object to return error
+                                &response,                  // Response message on success
+                                NULL);                       // input message (string,byte)
+                                // NULL);                  // First argument to getObjectFromId
+                                //"BOARD_1");             // Second Argument
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to resolve getPowerState to dbus: %s\n", bus_error.message);
+	    r = sd_bus_open_system(&bus);
+                if(r < 0){
+                        fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+                        sleep(1);
+                        }
+
+            goto finish;
+        }
+
+        rc = sd_bus_message_read(response, "i", &x);
+        if (rc < 0 )
+        {
+           fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
+           goto finish;
+        }
+        printf("PowerState value=[%d] \n",x);
+	if (x == 0 ) goto finish;
+	get_hdd_status();	
+        sleep(1);
+       sd_bus_error_free(&bus_error);
+       rc = sd_bus_call_method(bus,                   // On the System Bus
+                                gService,               // Service to contact
+                                gObjPath_o,            // Object path
+                                gIntPath,              // Interface name
+                                "getValue",          // Method to be called
+                                &bus_error,                 // object to return error
+                                &response,                  // Response message on success
+                                NULL);                       // input message (string,byte)
+                                // NULL);                  // First argument to getObjectFromId
+                                //"BOARD_1");             // Second Argument
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
+            goto finish;
+        }
+
+        rc = sd_bus_message_read(response, "v","s", &OccStatus);
+        if (rc < 0 )
+        {
+           fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
+           goto finish;
+        }
+        printf("OCCtate value=[%s][%d] \n",OccStatus,strcmp(OccStatus, "Disable"));
+	
+        if (strcmp(OccStatus, "Disable") != 1 ) goto finish;
+
+        rc = sd_bus_call_method(bus,                   // On the System Bus
+                                gService,               // Service to contact
+                                gObjPath,            // Object path
+                                gIntPath,              // Interface name
+                                "getValue",          // Method to be called
+                                &bus_error,                 // object to return error
+                                &response,                  // Response message on success
+                                NULL);                       // input message (string,byte)
+                                // NULL);                  // First argument to getObjectFromId
+                                //"BOARD_1");             // Second Argument
+
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
+            goto finish;
+        }
+
+	rc = sd_bus_message_read(response, "v","i", &x);
+	if (rc < 0 )
+	{ 
+           fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
+           goto finish;
+	}
+	printf("CPU value=[%d] \n",x);
+
+	if(x >= 90)
+	{
+	//printf("====Ken poweroff==== \n");
+	send_esel_to_dbus("CPU thermal trip", "High", "assoc", "hack", 3);
+	sd_bus_error_free(&bus_error);
+        rc = sd_bus_call_method(bus,                   // On the System Bus
+                                gService_c,               // Service to contact
+                                gObjPath_c,            // Object path
+                                gIntPath_c,              // Interface name
+                                "powerOff",          // Method to be called
+                                &bus_error,                 // object to return error
+                                &response,                  // Response message on success
+                                NULL);                       // input message (string,byte)
+                                // NULL);                  // First argument to getObjectFromId
+                                //"BOARD_1");             // Second Argument
+
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to resolve poweroff to dbus: %s\n", bus_error.message);
+            goto finish;
+        }
+
+	}
+	
+	sleep(1);
+///		sd_bus_unref(bus);
+	finish:
+		sd_bus_unref(bus);
+		sleep(1);
+}
+	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+
+int main(int argc, char *argv[]) {
+
+	return start_system_information();
+}
diff --git a/objects/log.h b/objects/log.h
new file mode 100644
index 0000000..a69d69e
--- /dev/null
+++ b/objects/log.h
@@ -0,0 +1,59 @@
+/*
+ * Copyright 2014-present Facebook. All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+#ifndef LOG_H
+#define LOG_H
+
+#include <stdio.h>
+#include <string.h>
+
+//#define DEBUG
+//#define VERBOSE
+
+#define _LOG(dst, fmt, ...) do {                  \
+  fprintf(dst, "%s:%d " fmt "\n",                 \
+          __FUNCTION__, __LINE__, ##__VA_ARGS__); \
+  fflush(dst);                                    \
+} while(0)
+
+#define LOG_ERR(err, fmt, ...) do {                       \
+  char buf[128];                                          \
+  strerror_r(err, buf, sizeof(buf));                      \
+  _LOG(stderr, "ERROR " fmt ": %s", ##__VA_ARGS__, buf);  \
+} while(0)
+
+#define LOG_INFO(fmt, ...) do {                 \
+  _LOG(stdout, fmt, ##__VA_ARGS__);             \
+} while(0)
+
+#ifdef DEBUG
+#define LOG_DBG(fmt, ...) do {                  \
+  _LOG(stdout, fmt, ##__VA_ARGS__);             \
+} while(0)
+#else
+#define LOG_DBG(fmt, ...)
+#endif
+
+#ifdef VERBOSE
+#define LOG_VER(fmt, ...) do {                  \
+  _LOG(stdout, fmt, ##__VA_ARGS__);             \
+} while(0)
+#else
+#define LOG_VER(fmt, ...)
+#endif
+
+#endif
-- 
2.8.1
