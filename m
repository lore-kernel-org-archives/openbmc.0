Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVFTL5gRfzDq80
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 14:31:02 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458703859968438.5392411118528;
 Tue, 22 Mar 2016 20:30:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton v3 04/12] Setup FUNC_MODE[2:0]
Date: Tue, 22 Mar 2016 22:30:45 -0500
Message-Id: <1458703853-32708-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458703853-32708-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458703853-32708-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2016 03:31:03 -0000

From: Ken <ken1029@gmail.com>

---
 objects/control_bmc_barreleye.c |  2 +-
 objects/control_bmc_obj.c       | 88 ++++++++++++++++++++---------------------
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/objects/control_bmc_barreleye.c b/objects/control_bmc_barreleye.c
index ddfde88..84f79f5 100644
--- a/objects/control_bmc_barreleye.c
+++ b/objects/control_bmc_barreleye.c
@@ -96,7 +96,7 @@ void reg_init()
 	devmem(bmcreg+0x80,0xCB000000);
 	devmem(bmcreg+0x88,0x01C000FF);
 	devmem(bmcreg+0x8c,0xC1C000FF);
-	devmem(bmcreg+0x90,0x003FA009);
+	devmem(bmcreg+0x90,0x003FA008);
 	devmem(bmcreg+0x88,0x01C0007F);
 
 
diff --git a/objects/control_bmc_obj.c b/objects/control_bmc_obj.c
index f1a47c7..a02f369 100644
--- a/objects/control_bmc_obj.c
+++ b/objects/control_bmc_obj.c
@@ -22,11 +22,11 @@ static const gchar* dbus_name        = "org.openbmc.control.Bmc";
 #define LPC_HICR7		0x88
 #define LPC_HICR8		0x8c
 #define SPI_BASE		(off_t)0x1e630000
-#define SCU_BASE                (off_t)0x1e780000
+#define SCU_BASE                (off_t)0x1e6e2000
 #define UART_BASE               (off_t)0x1e783000
 #define COM_BASE                (off_t)0x1e789000
 #define COM_BASE2               (off_t)0x1e789100
-#define GPIO_BASE		(off_t)0x1e6e2000
+#define GPIO_BASE		(off_t)0x1e780000
 
 static GDBusObjectManagerServer *manager = NULL;
 
@@ -45,7 +45,7 @@ void* memmap(int mem_fd,off_t base)
 
 void reg_init()
 {
-	g_print("BMC init\n");
+	g_print("===============BMC init===============\n");
 	// BMC init done here
 
 	void *bmcreg;
@@ -54,7 +54,9 @@ void reg_init()
 		printf("ERROR: Unable to open /dev/mem");
 		exit(1);
 	}
-
+	bmcreg = memmap(mem_fd,SCU_BASE);
+	devmem(bmcreg+0x90,0x003FA008);
+/*
 	bmcreg = memmap(mem_fd,LPC_BASE);
 	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
 	devmem(bmcreg+LPC_HICR7,0x30000E00); //32M PNOR
@@ -66,7 +68,6 @@ void reg_init()
 	devmem(bmcreg+0x04,0x00002404);
 
 	//UART
-
 	bmcreg = memmap(mem_fd,UART_BASE);
 	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
 	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
@@ -74,26 +75,24 @@ void reg_init()
 	bmcreg = memmap(mem_fd,COM_BASE);
 	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
 
-	bmcreg = memmap(mem_fd,SCU_BASE);
+	bmcreg = memmap(mem_fd,GPIO_BASE);
 	devmem(bmcreg+0x00,0x13008CE7);
 	devmem(bmcreg+0x04,0x0370E677);
 	devmem(bmcreg+0x20,0xDF48F7FF);
 	devmem(bmcreg+0x24,0xC738F202);
-
-
-	//GPIO
-	bmcreg = memmap(mem_fd,GPIO_BASE);
+	
+	bmcreg = memmap(mem_fd,SCU_BASE);
 	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
         devmem(bmcreg+0x70,0x120CE406);
 	devmem(bmcreg+0x80,0xCB000000);
 	devmem(bmcreg+0x88,0x01C000FF);
 	devmem(bmcreg+0x8c,0xC1C000FF);
-	devmem(bmcreg+0x90,0x003FA009);
+	devmem(bmcreg+0x90,0x003FA008);
 
 	bmcreg = memmap(mem_fd,COM_BASE);
 	devmem(bmcreg+0x170,0x00000042);
 	devmem(bmcreg+0x174,0x00004000);
-
+*/
 
 	close(mem_fd);
 }
@@ -110,29 +109,29 @@ on_init (Control          *control,
 	//control_emit_goto_system_state(control,"BMC_STARTING");
 	return TRUE;
 }
-
-static gboolean
-on_warm_reset (ControlBmc            	*bmc,
-               GDBusMethodInvocation	*invocation,
-               gpointer		            user_data)
-{
-	GError *err = NULL;
-	/* Wait a while before reboot, so the caller can be responded.
-	 * Note that g_spawn_command_line_async() cannot parse ';' as
-	 * a command separator. Need to use 'sh -c' to let shell parse it.
-	 */
-	gchar *reboot_command = "/bin/sh -c 'sleep 3;reboot'";
-
-	g_spawn_command_line_async(reboot_command, &err);
-	if (err != NULL) {
-		fprintf(stderr, "warmReset() error: %s\n", err->message);
-		g_error_free(err);
-	}
-
-	control_bmc_complete_warm_reset(bmc, invocation);
-	return TRUE;
-}
-
+
+static gboolean
+on_warm_reset (ControlBmc            	*bmc,
+               GDBusMethodInvocation	*invocation,
+               gpointer		            user_data)
+{
+	GError *err = NULL;
+	/* Wait a while before reboot, so the caller can be responded.
+	 * Note that g_spawn_command_line_async() cannot parse ';' as
+	 * a command separator. Need to use 'sh -c' to let shell parse it.
+	 */
+	gchar *reboot_command = "/bin/sh -c 'sleep 3;reboot'";
+
+	g_spawn_command_line_async(reboot_command, &err);
+	if (err != NULL) {
+		fprintf(stderr, "warmReset() error: %s\n", err->message);
+		g_error_free(err);
+	}
+
+	control_bmc_complete_warm_reset(bmc, invocation);
+	return TRUE;
+}
+
 gboolean go(gpointer user_data)
 {
  	cmdline *cmd = user_data;
@@ -145,8 +144,8 @@ gboolean go(gpointer user_data)
 	//g_main_loop_quit(cmd->loop);
 	return FALSE;
 }
-
-static void
+
+static void
 on_bus_acquired (GDBusConnection *connection,
                  const gchar     *name,
                  gpointer         user_data)
@@ -174,12 +173,12 @@ on_bus_acquired (GDBusConnection *connection,
                	    G_CALLBACK (on_init),
                	    NULL); /* user_data */
 
-
-	g_signal_connect (control_bmc,
-		"handle-warm-reset",
-		G_CALLBACK (on_warm_reset),
-		NULL); /* user_data */
-
+
+	g_signal_connect (control_bmc,
+		"handle-warm-reset",
+		G_CALLBACK (on_warm_reset),
+		NULL); /* user_data */
+
 	/* Export the object (@manager takes its own reference to @object) */
 	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
 	g_object_unref (object);
@@ -225,6 +224,7 @@ main (gint argc, gchar *argv[])
   guint id;
   loop = g_main_loop_new (NULL, FALSE);
   cmd.loop = loop;
+  reg_init();
 
   id = g_bus_own_name (DBUS_TYPE,
                        dbus_name,
@@ -237,7 +237,7 @@ main (gint argc, gchar *argv[])
                        NULL);
 
   g_main_loop_run (loop);
-
+
   g_bus_unown_name (id);
   g_main_loop_unref (loop);
   return 0;
-- 
2.7.1
