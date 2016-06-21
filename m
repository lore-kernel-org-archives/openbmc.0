Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYvdf5gQgzDqlM
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 03:21:10 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466529660425300.54668819771064;
 Tue, 21 Jun 2016 10:21:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 2/2] Remove dead code
Date: Tue, 21 Jun 2016 12:20:53 -0500
Message-Id: <20160621172053.23689-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160621172053.23689-1-openbmc-patches@stwcx.xyz>
References: <20160621172053.23689-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 17:21:11 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Removing a bunch of commented out code and unused applications.

Signed-of-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 Makefile                                 |   5 -
 bmcctl-barreleye/Makefile                |   3 -
 bmcctl-barreleye/control_bmc_barreleye.c | 247 -------------------------------
 bmcctl/control_bmc_obj.c                 | 110 --------------
 boardvpd/Makefile                        |   3 -
 boardvpd/board_vpd_obj.c                 |  59 --------
 fanctl/Makefile                          |   3 -
 fanctl/fan_generic_obj.c                 | 126 ----------------
 hwmon-barreleye/Makefile                 |   3 -
 hwmon-barreleye/hwmons_barreleye.c       | 212 --------------------------
 hwmon/Makefile                           |   3 -
 hwmon/hwmons_palmetto.c                  | 207 --------------------------
 12 files changed, 981 deletions(-)
 delete mode 100644 bmcctl-barreleye/Makefile
 delete mode 100644 bmcctl-barreleye/control_bmc_barreleye.c
 delete mode 100644 boardvpd/Makefile
 delete mode 100644 boardvpd/board_vpd_obj.c
 delete mode 100644 fanctl/Makefile
 delete mode 100644 fanctl/fan_generic_obj.c
 delete mode 100644 hwmon-barreleye/Makefile
 delete mode 100644 hwmon-barreleye/hwmons_barreleye.c
 delete mode 100644 hwmon/Makefile
 delete mode 100644 hwmon/hwmons_palmetto.c

diff --git a/Makefile b/Makefile
index 539c7d8..9bbd042 100644
--- a/Makefile
+++ b/Makefile
@@ -1,12 +1,7 @@
 GDBUS_APPS = bmcctl \
-	     bmcctl-barreleye \
-	     boardvpd \
-	     fanctl \
 	     flashbios \
 	     hostcheckstop \
 	     hostwatchdog \
-	     hwmon \
-	     hwmon-barreleye \
 	     op-flasher \
 	     op-hostctl \
 	     op-pwrctl \
diff --git a/bmcctl-barreleye/Makefile b/bmcctl-barreleye/Makefile
deleted file mode 100644
index d98fdeb..0000000
--- a/bmcctl-barreleye/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-BINS=control_bmc_barreleye
-include ../gdbus.mk
-include ../rules.mk
diff --git a/bmcctl-barreleye/control_bmc_barreleye.c b/bmcctl-barreleye/control_bmc_barreleye.c
deleted file mode 100644
index f09e379..0000000
--- a/bmcctl-barreleye/control_bmc_barreleye.c
+++ /dev/null
@@ -1,247 +0,0 @@
-#include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "gpio.h"
-
-/* ------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/control";
-static const gchar* instance_name = "bmc0";
-static const gchar* dbus_name = "org.openbmc.control.Bmc";
-static const gchar* i2c_dev = "/sys/bus/i2c/devices";
-
-//this probably should come from some global SOC config
-
-#define LPC_BASE		(off_t)0x1e789000
-#define LPC_HICR6		0x80
-#define LPC_HICR7		0x88
-#define LPC_HICR8		0x8c
-#define SPI_BASE		(off_t)0x1e630000
-#define SCU_BASE		(off_t)0x1e780000
-#define UART_BASE		(off_t)0x1e783000
-#define COM_BASE		(off_t)0x1e789000
-#define COM_BASE2		(off_t)0x1e789100
-#define GPIO_BASE		(off_t)0x1e6e2000
-
-static GDBusObjectManagerServer *manager = NULL;
-
-void*
-memmap(int mem_fd,off_t base)
-{
-	void* bmcreg;
-	bmcreg = mmap(NULL, getpagesize(),
-			PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, base);
-
-	if(bmcreg == MAP_FAILED) {
-		printf("ERROR: Unable to map LPC register memory");
-		exit(1);
-	}
-	return bmcreg;
-}
-
-void
-reg_init()
-{
-	g_print("BMC init\n");
-	// BMC init done here
-
-	void *bmcreg;
-	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
-	if(mem_fd < 0) {
-		printf("ERROR: Unable to open /dev/mem");
-		exit(1);
-	}
-
-	bmcreg = memmap(mem_fd,LPC_BASE);
-	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
-	devmem(bmcreg+LPC_HICR7,0x30000C00); //32M PNOR
-	devmem(bmcreg+LPC_HICR8,0xFC0003FF);
-
-	//flash controller
-	bmcreg = memmap(mem_fd,SPI_BASE);
-	devmem(bmcreg+0x00,0x00000003);
-	devmem(bmcreg+0x04,0x00002404);
-
-	//UART
-	bmcreg = memmap(mem_fd,UART_BASE);
-	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
-	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
-	devmem(bmcreg+0x08,0x000000c1);  //Disable Parity, 1 stop bit, 8 bits
-	bmcreg = memmap(mem_fd,COM_BASE);
-	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
-
-	bmcreg = memmap(mem_fd,SCU_BASE);
-	devmem(bmcreg+0x00,0x9e82fce7);
-	//devmem(bmcreg+0x00,0x9f82fce7); // B2?
-	devmem(bmcreg+0x04,0x0370e677);
-
-	// do not modify state of power pin, otherwise
-	// if this is a reboot, host will shutdown
-	uint32_t reg_20 = devmem_read(bmcreg+0x20);
-	reg_20 = reg_20 & 0x00000002;
-	devmem(bmcreg+0x20,0xcfc8f7fd | reg_20);
-	devmem(bmcreg+0x24,0xc738f20a);
-	devmem(bmcreg+0x80,0x0031ffaf);
-
-
-	//GPIO
-	bmcreg = memmap(mem_fd,GPIO_BASE);
-	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
-	devmem(bmcreg+0x80,0xCB000000);
-	devmem(bmcreg+0x88,0x01C000FF);
-	devmem(bmcreg+0x8c,0xC1C000FF);
-	devmem(bmcreg+0x90,0x003FA009);
-	devmem(bmcreg+0x88,0x01C0007F);
-
-
-	bmcreg = memmap(mem_fd,COM_BASE);
-	devmem(bmcreg+0x170,0x00000042);
-	devmem(bmcreg+0x174,0x00004000);
-
-	close(mem_fd);
-}
-
-int
-init_i2c_driver(int i2c_bus, const char* device, int address,bool delete)
-{
-	char dev[255];
-	g_print("Initing: device = %s, address = %02x\n",device,address);
-	if(!delete) {
-		sprintf(dev,"%s/i2c-%d/new_device",i2c_dev,i2c_bus);
-	} else {
-		sprintf(dev,"%s/i2c-%d/delete_device",i2c_dev,i2c_bus);
-	}
-	int fd = open(dev, O_WRONLY);
-	if(fd == -1) {
-		g_print("ERROR control_bmc: Unable to open device %s\n",dev);
-		return 1;
-	}
-	if(!delete) {
-		sprintf(dev,"%s 0x%02x",device,address);
-	} else {
-		sprintf(dev,"0x%02x",address);
-	}
-	int rc = write(fd,dev,strlen(dev));
-	close(fd);
-	if(rc != strlen(dev)) {
-		g_print("ERROR control_bmc: Unable to write %s\n",dev);
-		return 2;
-	}
-	return 0;
-}
-
-static gboolean
-on_init(Control *control,
-		GDBusMethodInvocation *invocation,
-		gpointer user_data)
-{
-	control_complete_init(control,invocation);
-
-	return TRUE;
-}
-
-gboolean
-go(gpointer user_data)
-{
-	cmdline *cmd = user_data;
-	Control* control = object_get_control((Object*)cmd->user_data);
-#ifdef __arm__
-	reg_init();
-#endif
-	control_emit_goto_system_state(control,"BMC_STARTING");
-
-	return FALSE;
-}
-
-static void
-on_bus_acquired(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-	ObjectSkeleton *object;
-	cmdline *cmd = user_data;
-	manager = g_dbus_object_manager_server_new(dbus_object_path);
-
-	gchar *s;
-	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
-	object = object_skeleton_new(s);
-	g_free(s);
-
-	ControlBmc* control_bmc = control_bmc_skeleton_new();
-	object_skeleton_set_control_bmc(object, control_bmc);
-	g_object_unref(control_bmc);
-
-	Control* control = control_skeleton_new();
-	object_skeleton_set_control(object, control);
-	g_object_unref(control);
-
-	//define method callbacks here
-	g_signal_connect(control,
-			"handle-init",
-			G_CALLBACK(on_init),
-			NULL); /* user_data */
-
-	/* Export the object (@manager takes its own reference to @object) */
-	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
-	g_object_unref(object);
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-
-	//TODO:  This is a bad hack to wait for object to be on bus
-	//sleep(1);
-	cmd->user_data = object;
-	g_idle_add(go,cmd);
-}
-
-static void
-on_name_acquired(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-}
-
-static void
-on_name_lost(GDBusConnection *connection,
-		const gchar     *name,
-		gpointer         user_data)
-{
-}
-
-/*----------------------------------------------------------------*/
-/* Main Event Loop                                                */
-
-gint
-main(gint argc, gchar *argv[])
-{
-	GMainLoop *loop;
-	cmdline cmd;
-	cmd.argc = argc;
-	cmd.argv = argv;
-
-	guint id;
-	loop = g_main_loop_new(NULL, FALSE);
-	cmd.loop = loop;
-
-	id = g_bus_own_name(DBUS_TYPE,
-			dbus_name,
-			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-			G_BUS_NAME_OWNER_FLAGS_REPLACE,
-			on_bus_acquired,
-			on_name_acquired,
-			on_name_lost,
-			&cmd,
-			NULL);
-
-	g_main_loop_run(loop);
-
-	g_bus_unown_name(id);
-	g_main_loop_unref(loop);
-	return 0;
-}
diff --git a/bmcctl/control_bmc_obj.c b/bmcctl/control_bmc_obj.c
index f3571cd..6dfa2da 100644
--- a/bmcctl/control_bmc_obj.c
+++ b/bmcctl/control_bmc_obj.c
@@ -1,115 +1,22 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <string.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
 #include "interfaces/openbmc_intf.h"
 #include "openbmc.h"
-#include "gpio.h"
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/control";
 static const gchar* instance_name = "bmc0";
 static const gchar* dbus_name = "org.openbmc.control.Bmc";
 
-//this probably should come from some global SOC config
-
-#define LPC_BASE		(off_t)0x1e789000
-#define LPC_HICR6		0x80
-#define LPC_HICR7		0x88
-#define LPC_HICR8		0x8c
-#define SPI_BASE		(off_t)0x1e630000
-#define SCU_BASE		(off_t)0x1e780000
-#define UART_BASE		(off_t)0x1e783000
-#define COM_BASE		(off_t)0x1e789000
-#define COM_BASE2		(off_t)0x1e789100
-#define GPIO_BASE		(off_t)0x1e6e2000
-
 static GDBusObjectManagerServer *manager = NULL;
 
-void*
-memmap(int mem_fd,off_t base)
-{
-	void* bmcreg;
-	bmcreg = mmap(NULL, getpagesize(),
-			PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, base);
-
-	if(bmcreg == MAP_FAILED) {
-		printf("ERROR: Unable to map LPC register memory");
-		exit(1);
-	}
-	return bmcreg;
-}
-
-void
-reg_init()
-{
-	g_print("BMC init\n");
-	// BMC init done here
-
-	void *bmcreg;
-	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
-	if(mem_fd < 0) {
-		printf("ERROR: Unable to open /dev/mem");
-		exit(1);
-	}
-
-	bmcreg = memmap(mem_fd,LPC_BASE);
-	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
-	devmem(bmcreg+LPC_HICR7,0x30000E00); //32M PNOR
-	devmem(bmcreg+LPC_HICR8,0xFE0001FF);
-
-	//flash controller
-	bmcreg = memmap(mem_fd,SPI_BASE);
-	devmem(bmcreg+0x00,0x00000003);
-	devmem(bmcreg+0x04,0x00002404);
-
-	//UART
-
-	bmcreg = memmap(mem_fd,UART_BASE);
-	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
-	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
-	devmem(bmcreg+0x08,0x000000c1);  //Disable Parity, 1 stop bit, 8 bits
-	bmcreg = memmap(mem_fd,COM_BASE);
-	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
-
-	bmcreg = memmap(mem_fd,SCU_BASE);
-	devmem(bmcreg+0x00,0x13008CE7);
-	devmem(bmcreg+0x04,0x0370E677);
-	devmem(bmcreg+0x20,0xDF48F7FF);
-	devmem(bmcreg+0x24,0xC738F202);
-
-
-	//GPIO
-	bmcreg = memmap(mem_fd,GPIO_BASE);
-	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
-	devmem(bmcreg+0x70,0x120CE406);
-	devmem(bmcreg+0x80,0xCB000000);
-	devmem(bmcreg+0x88,0x01C000FF);
-	devmem(bmcreg+0x8c,0xC1C000FF);
-	devmem(bmcreg+0x90,0x003FA009);
-
-	bmcreg = memmap(mem_fd,COM_BASE);
-	devmem(bmcreg+0x170,0x00000042);
-	devmem(bmcreg+0x174,0x00004000);
-
-
-	close(mem_fd);
-}
-
 static gboolean
 on_init(Control *control,
 		GDBusMethodInvocation *invocation,
 		gpointer user_data)
 {
-	//#ifdef __arm__
-	//reg_init();
-	//#endif
 	control_complete_init(control,invocation);
-	//control_emit_goto_system_state(control,"BMC_STARTING");
 	return TRUE;
 }
 
@@ -135,20 +42,6 @@ on_warm_reset(ControlBmc *bmc,
 	return TRUE;
 }
 
-gboolean
-go(gpointer user_data)
-{
-	cmdline *cmd = user_data;
-	Control* control = object_get_control((Object*)cmd->user_data);
-#ifdef __arm__
-	reg_init();
-#endif
-	control_emit_goto_system_state(control,"BMC_STARTING");
-
-	//g_main_loop_quit(cmd->loop);
-	return FALSE;
-}
-
 static void
 on_bus_acquired(GDBusConnection *connection,
 		const gchar *name,
@@ -190,10 +83,7 @@ on_bus_acquired(GDBusConnection *connection,
 	/* Export all objects */
 	g_dbus_object_manager_server_set_connection(manager, connection);
 
-	//TODO:  This is a bad hack to wait for object to be on bus
-	//sleep(1);
 	cmd->user_data = object;
-	//g_idle_add(go,cmd);
 }
 
 static void
diff --git a/boardvpd/Makefile b/boardvpd/Makefile
deleted file mode 100644
index e19c0db..0000000
--- a/boardvpd/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-BINS=board_vpd
-include ../gdbus.mk
-include ../rules.mk
diff --git a/boardvpd/board_vpd_obj.c b/boardvpd/board_vpd_obj.c
deleted file mode 100644
index b6c2119..0000000
--- a/boardvpd/board_vpd_obj.c
+++ /dev/null
@@ -1,59 +0,0 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-
-
-/* ------------------------------------------------------------------------- */
-
-gint
-main(gint argc, gchar *argv[])
-{
-	GMainLoop *loop;
-	GDBusConnection *c;
-	GDBusProxy *p;
-	GError *error;
-	GVariant *parm;
-
-	loop = g_main_loop_new(NULL, FALSE);
-
-	error = NULL;
-	c = g_bus_get_sync(DBUS_TYPE, NULL, &error);
-
-	error = NULL;
-	p = g_dbus_proxy_new_sync(c,
-			G_DBUS_PROXY_FLAGS_NONE,
-			NULL, /* GDBusInterfaceInfo* */
-			"org.openbmc.managers.Inventory", /* name */
-			"/org/openbmc/inventory/items/system/io_board", /* object path */
-			"org.openbmc.InventoryItem", /* interface name */
-			NULL, /* GCancellable */
-			&error);
-	g_assert_no_error(error);
-
-	//TODO: Read actual vpd
-	g_print("Reading VPD\n");
-	GVariantBuilder *b;
-	GVariant *dict;
-
-	b = g_variant_builder_new(G_VARIANT_TYPE("a{sv}"));
-	g_variant_builder_add(b, "{sv}", "manufacturer", g_variant_new_string("ibm"));
-	g_variant_builder_add(b, "{sv}", "part_num", g_variant_new_string("3N0001"));
-	dict = g_variant_builder_end(b);
-
-	//proxy_call wants parm as an array
-	parm = g_variant_new("(v)",dict);
-
-	error = NULL;
-	g_dbus_proxy_call_sync(p,
-			"update",
-			parm,
-			G_DBUS_CALL_FLAGS_NONE,
-			-1,
-			NULL,
-			&error);
-	g_assert_no_error(error);
-
-	g_object_unref(p);
-	g_object_unref(c);
-	g_main_loop_unref(loop);
-	return 0;
-}
diff --git a/fanctl/Makefile b/fanctl/Makefile
deleted file mode 100644
index 4f86828..0000000
--- a/fanctl/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-BINS=fan_generic
-include ../gdbus.mk
-include ../rules.mk
diff --git a/fanctl/fan_generic_obj.c b/fanctl/fan_generic_obj.c
deleted file mode 100644
index 61083ae..0000000
--- a/fanctl/fan_generic_obj.c
+++ /dev/null
@@ -1,126 +0,0 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-
-/* ------------------------------------------------------------------------- */
-
-static const gchar* dbus_object_path = "/org/openbmc/control";
-static const gchar* dbus_name = "org.openbmc.control.Fan";
-static guint heartbeat = 0;
-
-static GDBusObjectManagerServer *manager = NULL;
-
-static gboolean
-poll_sensor(gpointer user_data)
-{
-	//FruFan *fan = object_get_fan((Object*)user_data);
-	return TRUE;
-}
-
-static gboolean
-on_set_speed(Fan *fan,
-		GDBusMethodInvocation *invocation,
-		guint speed,
-		gpointer user_data)
-{
-	fan_set_speed(fan,speed);
-	fan_complete_set_speed(fan,invocation);
-	return TRUE;
-}
-
-static gboolean
-on_get_speed(Fan *fan,
-		GDBusMethodInvocation *invocation,
-		gpointer user_data)
-{
-	guint reading = fan_get_speed(fan);
-	fan_complete_get_speed(fan,invocation,reading);
-	return TRUE;
-}
-
-static void
-on_bus_acquired(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-	//g_print ("Acquired a message bus connection: %s\n",name);
-
-	cmdline *cmd = user_data;
-	if(cmd->argc < 2)
-	{
-		g_print("No objects created.  Put object name(s) on command line\n");
-		return;
-	}
-	manager = g_dbus_object_manager_server_new(dbus_object_path);
-	int i=0;
-	for(i=1;i<cmd->argc;i++)
-	{
-		gchar *s;
-		s = g_strdup_printf("%s/%s",dbus_object_path,cmd->argv[i]);
-		ObjectSkeleton *object = object_skeleton_new(s);
-		g_free(s);
-
-		Fan *fan = fan_skeleton_new();
-		object_skeleton_set_fan(object, fan);
-		g_object_unref(fan);
-
-		//define method callbacks here
-		g_signal_connect(fan,
-				"handle-get-speed",
-				G_CALLBACK(on_get_speed),
-				NULL); /* user_data */
-		g_signal_connect(fan,
-				"handle-set-speed",
-				G_CALLBACK(on_set_speed),
-				NULL); /* user_data */
-
-		//g_timeout_add(poll_interval, poll_sensor, object);
-
-		/* Export the object (@manager takes its own reference to @object) */
-		g_dbus_object_manager_server_set_connection(manager, connection);
-		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
-		g_object_unref(object);
-	}
-}
-
-static void
-on_name_acquired(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-	//g_print ("Acquired the name %s\n", name);
-}
-
-static void
-on_name_lost(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-	//g_print ("Lost the name %s\n", name);
-}
-
-gint
-main(gint argc, gchar *argv[])
-{
-	GMainLoop *loop;
-	cmdline cmd;
-	cmd.argc = argc;
-	cmd.argv = argv;
-	guint id;
-	loop = g_main_loop_new(NULL, FALSE);
-
-	id = g_bus_own_name(DBUS_TYPE,
-			dbus_name,
-			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-			G_BUS_NAME_OWNER_FLAGS_REPLACE,
-			on_bus_acquired,
-			on_name_acquired,
-			on_name_lost,
-			&cmd,
-			NULL);
-
-	g_main_loop_run(loop);
-
-	g_bus_unown_name(id);
-	g_main_loop_unref(loop);
-	return 0;
-}
diff --git a/hwmon-barreleye/Makefile b/hwmon-barreleye/Makefile
deleted file mode 100644
index 4e89e3c..0000000
--- a/hwmon-barreleye/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-BINS=hwmons_barreleye
-include ../gdbus.mk
-include ../rules.mk
diff --git a/hwmon-barreleye/hwmons_barreleye.c b/hwmon-barreleye/hwmons_barreleye.c
deleted file mode 100644
index 07717cf..0000000
--- a/hwmon-barreleye/hwmons_barreleye.c
+++ /dev/null
@@ -1,212 +0,0 @@
-#include "interfaces/openbmc_intf.h"
-#include <stdio.h>
-#include <stdlib.h>
-#include <fcntl.h>
-#include "openbmc.h"
-#include "gpio.h"
-
-/* ------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/sensors";
-static const gchar* dbus_name = "org.openbmc.sensors.hwmon";
-
-static GDBusObjectManagerServer *manager = NULL;
-
-typedef struct {
-	const gchar* filename;
-	const gchar* name;
-	int poll_interval;
-	const gchar* units;
-	int scale;
-	int fd;
-} HWMON;
-
-#define NUM_HWMONS 7
-
-// TODO: Don't hardcode
-//Hardcoded for barreleye
-HWMON hwmons[NUM_HWMONS] = {
-	(HWMON){"/sys/class/hwmon/hwmon0/temp1_input","temperature/ambient",3000,"C",1000},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm1","speed/fan0",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm2","speed/fan1",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm3","speed/fan2",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm1","speed/fan3",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm2","speed/fan4",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm3","speed/fan5",30000,"",1},
-};
-
-bool
-is_hwmon_valid(HWMON* hwmon)
-{
-	int fd = open(hwmon->filename, O_RDONLY);
-	if(fd == -1)
-	{
-		g_print("ERROR hwmon is not valid: %s\n",hwmon->filename);
-		return false;
-	}
-	close(fd);
-	return true;
-}
-
-static gboolean
-poll_hwmon(gpointer user_data)
-{
-	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
-	SensorValue *sensor = object_get_sensor_value((Object*)user_data);
-	const gchar* filename = hwmon_get_sysfs_path(hwmon);
-
-	int fd = open(filename, O_RDONLY);
-	if(fd != -1)
-	{
-		char buf[255];
-		if(read(fd,&buf,255) == -1)
-		{
-			g_print("ERROR: Unable to read value: %s\n",filename);
-		} else {
-			guint32 scale = hwmon_get_scale(hwmon);
-			if(scale == 0)
-			{
-				g_print("ERROR: Invalid scale value of 0\n");
-				scale = 1;
-
-			}
-			guint32 value = atoi(buf)/scale;
-			NEW_VARIANT_U(value);
-			GVariant* old_value = sensor_value_get_value(sensor);
-			bool do_set = false;
-			if(old_value == NULL)
-			{
-				do_set = true;
-			}
-			else
-			{
-				if(GET_VARIANT_U(old_value) != value) { do_set = true; }
-			}
-			if(do_set)
-			{
-				g_print("Sensor changed: %s,%d\n",filename,value);
-				GVariant* v = NEW_VARIANT_U(value);
-				const gchar* units = sensor_value_get_units(sensor);
-				sensor_value_set_value(sensor,v);
-				sensor_value_emit_changed(sensor,v,units);
-			}
-		}
-		close(fd);
-	} else {
-		g_print("ERROR - hwmons: File %s doesn't exist\n",filename);
-	}
-
-	return TRUE;
-}
-
-static gboolean
-on_set_value(SensorValue *sensor,
-		GDBusMethodInvocation *invocation,
-		GVariant* v_value,
-		gpointer user_data)
-{
-	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
-	const gchar* filename = hwmon_get_sysfs_path(hwmon);
-
-	int fd = open(filename, O_WRONLY);
-	if(fd != -1)
-	{
-		char buf[255];
-		guint32 value = GET_VARIANT_U(v_value);
-		sprintf(buf,"%d",value);
-		if(write(fd, buf, 255) == -1)
-		{
-			g_print("ERROR: Unable to read value: %s\n",filename);
-		}
-		close(fd);
-	}
-	sensor_value_complete_set_value(sensor,invocation);
-	return TRUE;
-}
-
-static void
-on_bus_acquired(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-	ObjectSkeleton *object;
-
-	manager = g_dbus_object_manager_server_new(dbus_object_path);
-	int i = 0;
-	for(i=0;i<NUM_HWMONS;i++)
-	{
-		if(!is_hwmon_valid(&hwmons[i])) { continue; }
-		gchar *s;
-		s = g_strdup_printf("%s/%s",dbus_object_path,hwmons[i].name);
-		object = object_skeleton_new(s);
-		g_free(s);
-
-		Hwmon *hwmon = hwmon_skeleton_new();
-		object_skeleton_set_hwmon(object, hwmon);
-		g_object_unref(hwmon);
-
-		SensorValue *sensor = sensor_value_skeleton_new();
-		object_skeleton_set_sensor_value(object, sensor);
-		g_object_unref(sensor);
-
-		hwmon_set_sysfs_path(hwmon,hwmons[i].filename);
-		hwmon_set_scale(hwmon,hwmons[i].scale);
-		sensor_value_set_units(sensor,hwmons[i].units);
-
-		//define method callbacks here
-		g_signal_connect(sensor,
-				"handle-set-value",
-				G_CALLBACK(on_set_value),
-				object); /* user_data */
-
-
-		if(hwmons[i].poll_interval > 0) {
-			g_timeout_add(hwmons[i].poll_interval, poll_hwmon, object);
-		}
-		/* Export the object (@manager takes its own reference to @object) */
-		g_dbus_object_manager_server_set_connection(manager, connection);
-		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
-		g_object_unref(object);
-	}
-}
-
-static void
-on_name_acquired(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-}
-
-static void
-on_name_lost(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-}
-
-gint
-main(gint argc, gchar *argv[])
-{
-	GMainLoop *loop;
-	cmdline cmd;
-	cmd.argc = argc;
-	cmd.argv = argv;
-
-	guint id;
-	loop = g_main_loop_new(NULL, FALSE);
-
-	id = g_bus_own_name(DBUS_TYPE,
-			dbus_name,
-			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-			G_BUS_NAME_OWNER_FLAGS_REPLACE,
-			on_bus_acquired,
-			on_name_acquired,
-			on_name_lost,
-			&cmd,
-			NULL);
-
-	g_main_loop_run(loop);
-
-	g_bus_unown_name(id);
-	g_main_loop_unref(loop);
-	return 0;
-}
diff --git a/hwmon/Makefile b/hwmon/Makefile
deleted file mode 100644
index 5b9a70f..0000000
--- a/hwmon/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-BINS=hwmons_palmetto
-include ../gdbus.mk
-include ../rules.mk
diff --git a/hwmon/hwmons_palmetto.c b/hwmon/hwmons_palmetto.c
deleted file mode 100644
index 7d76c91..0000000
--- a/hwmon/hwmons_palmetto.c
+++ /dev/null
@@ -1,207 +0,0 @@
-#include "interfaces/openbmc_intf.h"
-#include <stdio.h>
-#include <fcntl.h>
-#include "openbmc.h"
-#include "gpio.h"
-
-/* ------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/sensors";
-static const gchar* dbus_name = "org.openbmc.sensors.hwmon";
-
-static GDBusObjectManagerServer *manager = NULL;
-
-typedef struct {
-	const gchar* filename;
-	const gchar* name;
-	int poll_interval;
-	const gchar* units;
-	int scale;
-	int fd;
-} HWMON;
-
-#define NUM_HWMONS 1
-
-// TODO: Don't hardcode
-//Hardcoded for palmetto
-HWMON hwmons[NUM_HWMONS] = {
-	(HWMON){"/sys/class/hwmon/hwmon0/temp1_input","temperature/ambient",3000,"C",1000},
-};
-
-bool
-is_hwmon_valid(HWMON* hwmon)
-{
-	int fd = open(hwmon->filename, O_RDONLY);
-	if(fd == -1)
-	{
-		g_print("ERROR hwmon is not valid: %s\n",hwmon->filename);
-		return false;
-	}
-	close(fd);
-	return true;
-}
-
-static gboolean
-poll_hwmon(gpointer user_data)
-{
-	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
-	SensorValue *sensor = object_get_sensor_value((Object*)user_data);
-	const gchar* filename = hwmon_get_sysfs_path(hwmon);
-
-	int fd = open(filename, O_RDONLY);
-	if(fd != -1)
-	{
-		char buf[255];
-		if(read(fd,&buf,255) == -1)
-		{
-			g_print("ERROR: Unable to read value: %s\n",filename);
-		} else {
-			guint32 scale = hwmon_get_scale(hwmon);
-			if(scale == 0)
-			{
-				g_print("ERROR: Invalid scale value of 0\n");
-				scale = 1;
-
-			}
-			guint32 value = atoi(buf)/scale;
-			GVariant* v = NEW_VARIANT_U(value);
-			GVariant* old_value = sensor_value_get_value(sensor);
-			bool do_set = false;
-			if(old_value == NULL)
-			{
-				do_set = true;
-			}
-			else
-			{
-				if(GET_VARIANT_U(old_value) != value) { do_set = true; }
-			}
-			if(do_set)
-			{
-				g_print("Sensor changed: %s,%d\n",filename,value);
-				GVariant* v = NEW_VARIANT_U(value);
-				const gchar* units = sensor_value_get_units(sensor);
-				sensor_value_set_value(sensor,v);
-				sensor_value_emit_changed(sensor,v,units);
-			}
-		}
-		close(fd);
-	} else {
-		g_print("ERROR - hwmons: File %s doesn't exist\n",filename);
-	}
-
-	return TRUE;
-}
-
-static gboolean
-on_set_value(SensorValue *sensor,
-		GDBusMethodInvocation *invocation,
-		GVariant* v_value,
-		gpointer user_data)
-{
-	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
-	const gchar* filename = hwmon_get_sysfs_path(hwmon);
-
-	int fd = open(filename, O_WRONLY);
-	if(fd != -1)
-	{
-		char buf[255];
-		guint32 value = GET_VARIANT_U(v_value);
-		sprintf(buf,"%d",value);
-		if(write(fd, buf, 255) == -1)
-		{
-			g_print("ERROR: Unable to read value: %s\n",filename);
-		}
-		close(fd);
-	}
-	sensor_value_complete_set_value(sensor,invocation);
-	return TRUE;
-}
-
-static void
-on_bus_acquired(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-	ObjectSkeleton *object;
-
-	cmdline *cmd = user_data;
-
-	manager = g_dbus_object_manager_server_new(dbus_object_path);
-	int i = 0;
-	for(i=0;i<NUM_HWMONS;i++)
-	{
-		if(!is_hwmon_valid(&hwmons[i])) { continue; }
-		gchar *s;
-		s = g_strdup_printf("%s/%s",dbus_object_path,hwmons[i].name);
-		object = object_skeleton_new(s);
-		g_free(s);
-
-		Hwmon *hwmon = hwmon_skeleton_new();
-		object_skeleton_set_hwmon(object, hwmon);
-		g_object_unref(hwmon);
-
-		SensorValue *sensor = sensor_value_skeleton_new();
-		object_skeleton_set_sensor_value(object, sensor);
-		g_object_unref(sensor);
-
-		hwmon_set_sysfs_path(hwmon,hwmons[i].filename);
-		hwmon_set_scale(hwmon,hwmons[i].scale);
-		sensor_value_set_units(sensor,hwmons[i].units);
-
-		//define method callbacks here
-		g_signal_connect(sensor,
-				"handle-set-value",
-				G_CALLBACK(on_set_value),
-				object); /* user_data */
-
-
-		if(hwmons[i].poll_interval > 0) {
-			g_timeout_add(hwmons[i].poll_interval, poll_hwmon, object);
-		}
-		/* Export the object (@manager takes its own reference to @object) */
-		g_dbus_object_manager_server_set_connection(manager, connection);
-		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
-		g_object_unref(object);
-	}
-}
-
-static void
-on_name_acquired(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-}
-
-static void
-on_name_lost(GDBusConnection *connection,
-		const gchar *name,
-		gpointer user_data)
-{
-}
-
-gint
-main(gint argc, gchar *argv[])
-{
-	GMainLoop *loop;
-	cmdline cmd;
-	cmd.argc = argc;
-	cmd.argv = argv;
-
-	guint id;
-	loop = g_main_loop_new(NULL, FALSE);
-
-	id = g_bus_own_name(DBUS_TYPE,
-			dbus_name,
-			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-			G_BUS_NAME_OWNER_FLAGS_REPLACE,
-			on_bus_acquired,
-			on_name_acquired,
-			on_name_lost,
-			&cmd,
-			NULL);
-
-	g_main_loop_run(loop);
-
-	g_bus_unown_name(id);
-	g_main_loop_unref(loop);
-	return 0;
-}
-- 
2.9.0
