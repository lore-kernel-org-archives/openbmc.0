Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3HFT0lL1zDq64
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 19:31:24 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146278628237131.922215253918125;
 Mon, 9 May 2016 02:31:22 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken Lai <ken1029@gmail.com>
Subject: [PATCH skeleton v7 21/21] Revert "Setup FUNC_MODE[2:0]"
Date: Mon,  9 May 2016 04:30:54 -0500
Message-Id: <1462786254-18000-22-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 May 2016 09:31:25 -0000

From: Ken Lai <ken1029@gmail.com>

This reverts commit c648d4d6484a9ec789b853b709db17dfb94d8187.

Conflicts:
	objects/control_bmc_barreleye.c
	objects/control_bmc_obj.c
---
 Makefile                        |   5 +-
 objects/control_bmc_barreleye.c | 496 ++++++++++++++++++++--------------------
 objects/control_bmc_obj.c       | 445 +++++++++++++++++------------------
 3 files changed, 473 insertions(+), 473 deletions(-)

diff --git a/Makefile b/Makefile
index 78e48b8..e2aac60 100755
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@ LIB_FLAG += $(shell pkg-config  --libs libsystemd)
 %.o: objects/pflash/libflash/%.c
 	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
-all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios flasher pflash hwmons_barreleye control_bmc i2craw info fan_algorithm
+all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios flasher pflash hwmons_barreleye control_bmc info fan_algorithm
 
 setup: 
 	mkdir -p obj lib
@@ -69,9 +69,6 @@ flasher:  $(OBJS2) flasher_obj.o libopenbmc_intf
 pflash:  $(OBJS2) pflash.o
 	$(CC) -o bin/$@ obj/pflash.o $(OBJS3) $(LDFLAGS)
 
-i2craw:  $(OBJS2) i2craw.o
-	$(CC) -o bin/$@ obj/i2craw.o $(LDFLAGS)
-
 info:   info.o
 	$(CC) -o bin/$@ obj/info.o $(LDFLAGS) $(LIBS_info)
 
diff --git a/objects/control_bmc_barreleye.c b/objects/control_bmc_barreleye.c
index f09e379..ddfde88 100644
--- a/objects/control_bmc_barreleye.c
+++ b/objects/control_bmc_barreleye.c
@@ -1,247 +1,249 @@
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
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "gpio.h"
+
+/* ---------------------------------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* instance_name = "bmc0";
+static const gchar* dbus_name        = "org.openbmc.control.Bmc";
+static const gchar* i2c_dev = "/sys/bus/i2c/devices";
+
+//this probably should come from some global SOC config
+
+#define LPC_BASE		(off_t)0x1e789000
+#define LPC_HICR6		0x80
+#define LPC_HICR7		0x88
+#define LPC_HICR8		0x8c
+#define SPI_BASE		(off_t)0x1e630000
+#define SCU_BASE                (off_t)0x1e780000
+#define UART_BASE               (off_t)0x1e783000
+#define COM_BASE                (off_t)0x1e789000
+#define COM_BASE2               (off_t)0x1e789100
+#define GPIO_BASE		(off_t)0x1e6e2000
+
+static GDBusObjectManagerServer *manager = NULL;
+
+void* memmap(int mem_fd,off_t base)
+{
+	void* bmcreg;
+	bmcreg = mmap(NULL, getpagesize(),
+			PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, base);
+
+	if (bmcreg == MAP_FAILED) {
+		printf("ERROR: Unable to map LPC register memory");
+		exit(1);
+	}
+	return bmcreg;
+}
+
+void reg_init()
+{
+	g_print("BMC init\n");
+	// BMC init done here
+
+	void *bmcreg;
+	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
+	if (mem_fd < 0) {
+		printf("ERROR: Unable to open /dev/mem");
+		exit(1);
+	}
+
+	bmcreg = memmap(mem_fd,LPC_BASE);
+	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
+	devmem(bmcreg+LPC_HICR7,0x30000C00); //32M PNOR
+	devmem(bmcreg+LPC_HICR8,0xFC0003FF);
+
+	//flash controller
+	bmcreg = memmap(mem_fd,SPI_BASE);
+	devmem(bmcreg+0x00,0x00000003);
+	devmem(bmcreg+0x04,0x00002404);
+
+	//UART
+
+	
+	bmcreg = memmap(mem_fd,UART_BASE);
+	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
+	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
+	devmem(bmcreg+0x08,0x000000c1);  //Disable Parity, 1 stop bit, 8 bits
+	bmcreg = memmap(mem_fd,COM_BASE);
+	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
+
+	bmcreg = memmap(mem_fd,SCU_BASE);
+	devmem(bmcreg+0x00,0x9e82fce7);
+	//devmem(bmcreg+0x00,0x9f82fce7); // B2?
+	devmem(bmcreg+0x04,0x0370e677);
+	
+	// do not modify state of power pin, otherwise 
+	// if this is a reboot, host will shutdown
+	uint32_t reg_20 = devmem_read(bmcreg+0x20);
+	reg_20 = reg_20 & 0x00000002;	
+	devmem(bmcreg+0x20,0xcfc8f7fd | reg_20);
+	devmem(bmcreg+0x24,0xc738f20a);
+	devmem(bmcreg+0x80,0x0031ffaf);
+
+
+	//GPIO
+	bmcreg = memmap(mem_fd,GPIO_BASE);
+	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
+	devmem(bmcreg+0x80,0xCB000000);
+	devmem(bmcreg+0x88,0x01C000FF);
+	devmem(bmcreg+0x8c,0xC1C000FF);
+	devmem(bmcreg+0x90,0x003FA009);
+	devmem(bmcreg+0x88,0x01C0007F);
+
+
+	bmcreg = memmap(mem_fd,COM_BASE);
+	devmem(bmcreg+0x170,0x00000042);
+	devmem(bmcreg+0x174,0x00004000);
+
+	close(mem_fd);
+}
+
+int init_i2c_driver(int i2c_bus, const char* device, int address,bool delete)
+{
+	char dev[255];
+	g_print("Initing: device = %s, address = %02x\n",device,address);
+	if (!delete) {
+		sprintf(dev,"%s/i2c-%d/new_device",i2c_dev,i2c_bus);
+	} else {
+		sprintf(dev,"%s/i2c-%d/delete_device",i2c_dev,i2c_bus);
+	}
+	int fd = open(dev, O_WRONLY);
+	if (fd == -1) {
+		g_print("ERROR control_bmc: Unable to open device %s\n",dev);
+		return 1;
+	}
+	if (!delete) {
+		sprintf(dev,"%s 0x%02x",device,address);
+	} else {
+		sprintf(dev,"0x%02x",address);
+	}
+	int rc = write(fd,dev,strlen(dev));
+	close(fd);
+	if (rc != strlen(dev)) {
+		g_print("ERROR control_bmc: Unable to write %s\n",dev);
+		return 2;
+	}
+	return 0;
+}
+
+
+static gboolean
+on_init (Control          *control,
+         GDBusMethodInvocation  *invocation,
+         gpointer                user_data)
+{
+	control_complete_init(control,invocation);
+	
+	return TRUE;
+}
+gboolean go(gpointer user_data)
+{
+ 	cmdline *cmd = user_data;
+	Control* control = object_get_control((Object*)cmd->user_data);
+	#ifdef __arm__
+	reg_init();
+	#endif
+	control_emit_goto_system_state(control,"BMC_STARTING");
+	
+	return FALSE;
+}
+
+static void 
+on_bus_acquired (GDBusConnection *connection,
+                 const gchar     *name,
+                 gpointer         user_data)
+{
+	ObjectSkeleton *object;
+ 	cmdline *cmd = user_data;
+  	manager = g_dbus_object_manager_server_new (dbus_object_path);
+
+	gchar *s;
+	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new (s);
+	g_free (s);
+
+	ControlBmc* control_bmc = control_bmc_skeleton_new ();
+	object_skeleton_set_control_bmc (object, control_bmc);
+	g_object_unref (control_bmc);
+
+	Control* control = control_skeleton_new ();
+	object_skeleton_set_control (object, control);
+	g_object_unref (control);
+
+	//define method callbacks here
+	g_signal_connect (control,
+       	            "handle-init",
+               	    G_CALLBACK (on_init),
+               	    NULL); /* user_data */
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
+	g_object_unref (object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection (manager, connection);
+
+	//TODO:  This is a bad hack to wait for object to be on bus
+	//sleep(1);
+	cmd->user_data = object;
+	g_idle_add(go,cmd);
+}
+
+
+static void
+on_name_acquired (GDBusConnection *connection,
+                  const gchar     *name,
+                  gpointer         user_data)
+{
+
+
+}
+
+static void
+on_name_lost (GDBusConnection *connection,
+              const gchar     *name,
+              gpointer         user_data)
+{
+}
+
+
+/*----------------------------------------------------------------*/
+/* Main Event Loop                                                */
+
+gint
+main (gint argc, gchar *argv[])
+{
+  GMainLoop *loop;
+  cmdline cmd;
+  cmd.argc = argc;
+  cmd.argv = argv;
+
+  guint id;
+  loop = g_main_loop_new (NULL, FALSE);
+  cmd.loop = loop;
+
+  id = g_bus_own_name (DBUS_TYPE,
+                       dbus_name,
+                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
+                       on_bus_acquired,
+                       on_name_acquired,
+                       on_name_lost,
+                       &cmd,
+                       NULL);
+
+  g_main_loop_run (loop);
+  
+  g_bus_unown_name (id);
+  g_main_loop_unref (loop);
+  return 0;
+}
diff --git a/objects/control_bmc_obj.c b/objects/control_bmc_obj.c
index f3571cd..f1a47c7 100644
--- a/objects/control_bmc_obj.c
+++ b/objects/control_bmc_obj.c
@@ -1,122 +1,120 @@
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
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "gpio.h"
+
+/* ---------------------------------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* instance_name = "bmc0";
+static const gchar* dbus_name        = "org.openbmc.control.Bmc";
+
+//this probably should come from some global SOC config
+
+#define LPC_BASE		(off_t)0x1e789000
+#define LPC_HICR6		0x80
+#define LPC_HICR7		0x88
+#define LPC_HICR8		0x8c
+#define SPI_BASE		(off_t)0x1e630000
+#define SCU_BASE                (off_t)0x1e780000
+#define UART_BASE               (off_t)0x1e783000
+#define COM_BASE                (off_t)0x1e789000
+#define COM_BASE2               (off_t)0x1e789100
+#define GPIO_BASE		(off_t)0x1e6e2000
+
+static GDBusObjectManagerServer *manager = NULL;
+
+void* memmap(int mem_fd,off_t base)
+{
+	void* bmcreg;
+	bmcreg = mmap(NULL, getpagesize(),
+			PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, base);
+
+	if (bmcreg == MAP_FAILED) {
+		printf("ERROR: Unable to map LPC register memory");
+		exit(1);
+	}
+	return bmcreg;
+}
+
+void reg_init()
+{
+	g_print("BMC init\n");
+	// BMC init done here
+
+	void *bmcreg;
+	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
+	if (mem_fd < 0) {
+		printf("ERROR: Unable to open /dev/mem");
+		exit(1);
+	}
+
+	bmcreg = memmap(mem_fd,LPC_BASE);
+	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
+	devmem(bmcreg+LPC_HICR7,0x30000E00); //32M PNOR
+	devmem(bmcreg+LPC_HICR8,0xFE0001FF);
+
+	//flash controller
+	bmcreg = memmap(mem_fd,SPI_BASE);
+	devmem(bmcreg+0x00,0x00000003);
+	devmem(bmcreg+0x04,0x00002404);
+
+	//UART
+
+	bmcreg = memmap(mem_fd,UART_BASE);
+	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
+	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
+	devmem(bmcreg+0x08,0x000000c1);  //Disable Parity, 1 stop bit, 8 bits
+	bmcreg = memmap(mem_fd,COM_BASE);
+	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
+
+	bmcreg = memmap(mem_fd,SCU_BASE);
+	devmem(bmcreg+0x00,0x13008CE7);
+	devmem(bmcreg+0x04,0x0370E677);
+	devmem(bmcreg+0x20,0xDF48F7FF);
+	devmem(bmcreg+0x24,0xC738F202);
+
+
+	//GPIO
+	bmcreg = memmap(mem_fd,GPIO_BASE);
+	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
+        devmem(bmcreg+0x70,0x120CE406);
+	devmem(bmcreg+0x80,0xCB000000);
+	devmem(bmcreg+0x88,0x01C000FF);
+	devmem(bmcreg+0x8c,0xC1C000FF);
+	devmem(bmcreg+0x90,0x003FA009);
+
+	bmcreg = memmap(mem_fd,COM_BASE);
+	devmem(bmcreg+0x170,0x00000042);
+	devmem(bmcreg+0x174,0x00004000);
+
+
+	close(mem_fd);
+}
+
+static gboolean
+on_init (Control          *control,
+         GDBusMethodInvocation  *invocation,
+         gpointer                user_data)
+{
+	//#ifdef __arm__
+	//reg_init();
+	//#endif
+	control_complete_init(control,invocation);
+	//control_emit_goto_system_state(control,"BMC_STARTING");
+	return TRUE;
+}
 
 static gboolean
-on_init(Control *control,
-		GDBusMethodInvocation *invocation,
-		gpointer user_data)
-{
-	//#ifdef __arm__
-	//reg_init();
-	//#endif
-	control_complete_init(control,invocation);
-	//control_emit_goto_system_state(control,"BMC_STARTING");
-	return TRUE;
-}
-
-static gboolean
-on_warm_reset(ControlBmc *bmc,
-		GDBusMethodInvocation *invocation,
-		gpointer user_data)
+on_warm_reset (ControlBmc            	*bmc,
+               GDBusMethodInvocation	*invocation,
+               gpointer		            user_data)
 {
 	GError *err = NULL;
 	/* Wait a while before reboot, so the caller can be responded.
@@ -126,7 +124,7 @@ on_warm_reset(ControlBmc *bmc,
 	gchar *reboot_command = "/bin/sh -c 'sleep 3;reboot'";
 
 	g_spawn_command_line_async(reboot_command, &err);
-	if(err != NULL) {
+	if (err != NULL) {
 		fprintf(stderr, "warmReset() error: %s\n", err->message);
 		g_error_free(err);
 	}
@@ -135,109 +133,112 @@ on_warm_reset(ControlBmc *bmc,
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
-
-	g_signal_connect(control_bmc,
-			"handle-warm-reset",
-			G_CALLBACK(on_warm_reset),
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
-	//g_idle_add(go,cmd);
-}
+gboolean go(gpointer user_data)
+{
+ 	cmdline *cmd = user_data;
+	Control* control = object_get_control((Object*)cmd->user_data);
+	#ifdef __arm__
+	reg_init();
+	#endif
+	control_emit_goto_system_state(control,"BMC_STARTING");
+
+	//g_main_loop_quit(cmd->loop);
+	return FALSE;
+}
 
 static void
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
+on_bus_acquired (GDBusConnection *connection,
+                 const gchar     *name,
+                 gpointer         user_data)
+{
+	ObjectSkeleton *object;
+ 	cmdline *cmd = user_data;
+  	manager = g_dbus_object_manager_server_new (dbus_object_path);
+
+	gchar *s;
+	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new (s);
+	g_free (s);
+
+	ControlBmc* control_bmc = control_bmc_skeleton_new ();
+	object_skeleton_set_control_bmc (object, control_bmc);
+	g_object_unref (control_bmc);
+
+	Control* control = control_skeleton_new ();
+	object_skeleton_set_control (object, control);
+	g_object_unref (control);
+
+	//define method callbacks here
+	g_signal_connect (control,
+       	            "handle-init",
+               	    G_CALLBACK (on_init),
+               	    NULL); /* user_data */
+
+
+	g_signal_connect (control_bmc,
+		"handle-warm-reset",
+		G_CALLBACK (on_warm_reset),
+		NULL); /* user_data */
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
+	g_object_unref (object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection (manager, connection);
+
+	//TODO:  This is a bad hack to wait for object to be on bus
+	//sleep(1);
+	cmd->user_data = object;
+	//g_idle_add(go,cmd);
+}
+
+
+static void
+on_name_acquired (GDBusConnection *connection,
+                  const gchar     *name,
+                  gpointer         user_data)
+{
+
+
+}
+
+static void
+on_name_lost (GDBusConnection *connection,
+              const gchar     *name,
+              gpointer         user_data)
+{
+}
+
+
+/*----------------------------------------------------------------*/
+/* Main Event Loop                                                */
+
+gint
+main (gint argc, gchar *argv[])
+{
+  GMainLoop *loop;
+  cmdline cmd;
+  cmd.argc = argc;
+  cmd.argv = argv;
+
+  guint id;
+  loop = g_main_loop_new (NULL, FALSE);
+  cmd.loop = loop;
+
+  id = g_bus_own_name (DBUS_TYPE,
+                       dbus_name,
+                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
+                       on_bus_acquired,
+                       on_name_acquired,
+                       on_name_lost,
+                       &cmd,
+                       NULL);
+
+  g_main_loop_run (loop);
+
+  g_bus_unown_name (id);
+  g_main_loop_unref (loop);
+  return 0;
+}
-- 
2.8.1
