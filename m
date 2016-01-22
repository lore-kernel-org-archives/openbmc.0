Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D1FA11A07C7
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 23:10:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453464637842825.8219452151592;
 Fri, 22 Jan 2016 04:10:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Refactored LED control dbus methods
Date: Fri, 22 Jan 2016 06:10:36 -0600
Message-Id: <1453464636-7721-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453464636-7721-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453464636-7721-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 12:10:45 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 Makefile                     |   5 +-
 objects/led_controller_new.c | 448 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 452 insertions(+), 1 deletion(-)
 create mode 100755 objects/led_controller_new.c

diff --git a/Makefile b/Makefile
index ea2dde2..bdf619a 100755
--- a/Makefile
+++ b/Makefile
@@ -22,7 +22,7 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 %.o: objects/pflash/libflash/%.c
 	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
-all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher control_bmc_barreleye pflash hwmons_barreleye
+all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher control_bmc_barreleye pflash hwmons_barreleye led_controller_new
 
 setup: 
 	mkdir -p obj lib
@@ -39,6 +39,9 @@ power_control: power_control_obj.o gpio.o object_mapper.o libopenbmc_intf
 led_controller: led_controller.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
+led_controller_new: led_controller_new.o
+	$(CC) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIBS) -lsystemd
+
 button_power: button_power_obj.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
diff --git a/objects/led_controller_new.c b/objects/led_controller_new.c
new file mode 100755
index 0000000..16170af
--- /dev/null
+++ b/objects/led_controller_new.c
@@ -0,0 +1,448 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <string.h>
+#include <dirent.h>
+#include <systemd/sd-bus.h>
+
+// These are control files that are present for each led under
+// '/sys/class/leds/<led_name>/' which are used to trigger action
+// on the respective leds by writing predefined data.
+const char *power_ctrl = "brightness";
+const char *blink_ctrl = "trigger";
+const char *duty_on   = "delay_on";
+const char *duty_off  = "delay_off";
+
+//--------------------------------------------------
+// Given the dbus path, returns the name of the LED
+//--------------------------------------------------
+char *get_led_name(char *dbus_path)
+{
+    char *led_name = NULL;
+    char *token = NULL;
+
+    // Get the led name from /org/openbmc/control/led/<name>
+    token = strtok(dbus_path, "/");
+    while(token != NULL)
+    {
+        led_name = token;
+        token = strtok(NULL, "/");
+    }
+
+    return led_name;
+}
+
+//-------------------------------------------------------------------------
+// Writes the 'on / off / blink' trigger to leds.
+//-------------------------------------------------------------------------
+int write_to_led(const char *name, const char *ctrl_file, const char *value)
+{
+    // Generic error reporter.
+    int rc = -1;
+
+    // To get /sys/class/leds/<name>/<control file>
+    char led_path[128] = {0};
+
+    strcpy(led_path, "/sys/class/leds/");
+    strcat(led_path, name);
+    strcat(led_path, "/");
+    strcat(led_path, ctrl_file);
+
+    FILE *fp = fopen(led_path,"w");
+    if(fp == NULL)
+    {
+        fprintf(stderr,"Error opening:[%s]\n",led_path);
+        perror("Error:");
+        return rc;
+    }
+
+    if(fwrite(value, strlen(value), 1, fp) != 1)
+    {
+        fprintf(stderr, "Error writing to :[%s]\n",led_path);
+        perror("Error:");
+    }
+
+    fclose(fp);
+    return rc < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+//----------------------------------------------------------------
+// Router function for any LED operations that come via dbus
+//----------------------------------------------------------------
+static int led_function_router(sd_bus_message *msg, void *user_data,
+                               sd_bus_error *ret_error)
+{
+    // Generic error reporter.
+    int rc = -1;
+
+    // Extract the led name from the full dbus path
+    char *led_path = sd_bus_message_get_path(msg);
+    char *led_name = get_led_name(led_path);
+    if(led_name == NULL)
+    {
+        fprintf(stderr, "Invalid LED name for path :[%s]\n",led_path);
+        sd_bus_reply_method_return(msg, "i", rc);
+    }
+
+    // Now that we have the LED name, get the Operation.
+    const char *led_function = sd_bus_message_get_member(msg);
+    if(led_function == NULL)
+    {
+        fprintf(stderr, "Null LED function specificed for : [%s]\n",led_name);
+        sd_bus_reply_method_return(msg, "i", rc);
+    }
+
+    // Route the user action to appropriate handlers.
+    if( (strcmp(led_function, "TurnOn") == 0) ||
+        (strcmp(led_function, "TurnOff") == 0))
+    {
+        rc = led_stable_state_function(led_name, led_function);
+        sd_bus_reply_method_return(msg, "i", rc);
+    }
+    else if( (strcmp(led_function, "BlinkFast") == 0) ||
+             (strcmp(led_function, "BlinkSlow") == 0))
+    {
+        rc = led_default_blink(led_name, led_function);
+        sd_bus_reply_method_return(msg, "i", rc);
+    }
+    else if(strcmp(led_function, "BlinkCustom") == 0)
+    {
+        rc = led_custom_blink(led_name, msg);
+        sd_bus_reply_method_return(msg, "i", rc);
+    }
+    else if(strcmp(led_function, "GetCurrentBrightness") == 0)
+    {
+        char value_str[10] = {0};
+        char *led_state = NULL;
+
+        rc = read_led(led_name, power_ctrl, value_str);
+        if(rc >= 0)
+        {
+            led_state = strtoul(value_str, NULL, 0) ? "Off" : "On";
+        }
+        sd_bus_reply_method_return(msg, "is", rc, led_state);
+    }
+    else
+    {
+        fprintf(stderr,"Invalid LED function:[%s]\n",led_function);
+    }
+
+    sd_bus_reply_method_return(msg, "i", rc);
+}
+
+//--------------------------------------------------------------
+// Turn On or Turn Off the LED
+//--------------------------------------------------------------
+int led_stable_state_function(char *led_name, char *led_function)
+{
+    // Generic error reporter.
+    int rc = -1;
+
+    const char *value = NULL;
+    if(strcmp(led_function, "TurnOn") == 0)
+    {
+        // LED active low
+        value = "0";
+    }
+    else if(strcmp(led_function, "TurnOff") == 0)
+    {
+        value  = "255";
+    }
+    else
+    {
+        fprintf(stderr,"Invalid LED solid state operation:[%s] \n",led_function);
+        return rc;
+    }
+
+    // Before doing anything, need to turn off the blinking
+    // if there is one in progress by writing 'none' to trigger
+    rc = write_to_led(led_name, blink_ctrl, "none");
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error disabling blink. Function:[%s]\n", led_function);
+        return rc;
+    }
+
+    // Open the brightness file and write corresponding values.
+    rc = write_to_led(led_name, power_ctrl, value);
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error driving LED. Function:[%s]\n", led_function);
+    }
+
+    return rc;
+}
+
+//-----------------------------------------------------------------------------------
+// Given the on and off duration, applies the action on the specified LED.
+//-----------------------------------------------------------------------------------
+int blink_led(const char *led_name, const char *on_duration, const char *off_duration)
+{
+    // Generic error reporter
+    int rc = -1;
+
+    // Protocol demands that 'timer' be echoed to 'trigger'
+    rc = write_to_led(led_name, blink_ctrl, "timer");
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error writing timer to Led:[%s]\n", led_name);
+        return rc;
+    }
+
+    // After writing 'timer to 'trigger', 2 new files get generated namely
+    // 'delay_on' and 'delay_off' which are telling the time duration for a
+    // particular LED on and off.
+    rc = write_to_led(led_name, duty_on, on_duration);
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error writing [%s] to delay_on:[%s]\n",on_duration,led_name);
+        return rc;
+    }
+
+    rc = write_to_led(led_name, duty_off, off_duration);
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error writing [%s] to delay_off:[%s]\n",off_duration,led_name);
+    }
+
+    return rc;
+}
+
+//----------------------------------------------------
+// Default blink action on the LED.
+//----------------------------------------------------
+int led_default_blink(char *led_name, char *blink_type)
+{
+    // Generic error reporter
+    int rc = -1;
+
+    // How long the LED needs to be in on and off state while blinking
+    const char *on_duration = NULL;
+    const char *off_duration = NULL;
+    if(strcmp(blink_type, "BlinkSlow") == 0)
+    {
+        // Delay 700 millisec before 'on' and delay 200 millisec before off
+        on_duration = "700";
+        off_duration = "200";
+    }
+    else if(strcmp(blink_type, "BlinkFast") == 0)
+    {
+        // Delay 200 millisec before 'on' and delay 200 millisec before off
+        on_duration = "200";
+        off_duration = "200";
+    }
+    else
+    {
+        fprintf(stderr,"Invalid blink operation:[%s]\n",blink_type);
+        return rc;
+    }
+
+    rc = blink_led(led_name, on_duration, off_duration);
+
+    return rc;
+}
+
+//-------------------------------------------------
+// Blinks at user defined 'on' and 'off' intervals.
+//-------------------------------------------------
+int led_custom_blink(const char *led_name, sd_bus_message *msg)
+{
+    // Generic error reporter.
+    int rc = -1;
+
+    // User supplied 'on' and 'off' duration
+    const char *on_duration = NULL;
+    const char *off_duration = NULL;
+
+    // Extract values into 'ss' ( string, string)
+    rc = sd_bus_message_read(msg, "ss", &on_duration, &off_duration);
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed to read 'on' and 'off' duration.[%s]\n", strerror(-rc));
+    }
+    else
+    {
+        rc = blink_led(led_name, on_duration, off_duration);
+    }
+
+    return rc;
+}
+
+//---------------------------------------------------------------
+// Gets the current value of passed in LED file
+// Mainly used for reading 'brightness'
+// NOTE : It is the responsibility of the caller to allocate
+// sufficient space for buffer
+//----------------------------------------------------------------
+int read_led(const char *name, const char *ctrl_file, void *value)
+{
+    // Generic error reporter.
+    int rc = -1;
+    int count = 0;
+
+    if(value == NULL)
+    {
+        fprintf(stderr, "Invalid buffer passed to LED read\n");
+        return rc;
+    }
+
+    // To get /sys/class/leds/<name>/<control file>
+    char led_path[128] = {0};
+
+    strcpy(led_path, "/sys/class/leds/");
+    strcat(led_path, name);
+    strcat(led_path, "/");
+    strcat(led_path, ctrl_file);
+
+    FILE *fp = fopen(led_path,"rb");
+    if(fp == NULL)
+    {
+        fprintf(stderr,"Error opening:[%s]\n",led_path);
+        perror("Error:");
+        return rc;
+    }
+
+    char *sysfs_value = (char *)value;
+    while((feof(fp)) == 0)
+    {
+        sysfs_value[count++] = fgetc(fp);
+    }
+    sysfs_value[count]='\0';
+
+    fclose(fp);
+    return EXIT_SUCCESS;
+}
+
+//-----------------------------------------------
+// Dbus Services offered by this LED controller
+//-----------------------------------------------
+static const sd_bus_vtable led_control_vtable[] =
+{
+    SD_BUS_VTABLE_START(0),
+    SD_BUS_METHOD("TurnOn", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("TurnOff", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("BlinkFast", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("BlinkSlow", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("BlinkCustom", "ss", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("GetCurrentBrightness", "", "is", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_VTABLE_END,
+};
+
+//---------------------------------------------
+// Interested in all files except standard ones
+//---------------------------------------------
+int led_select(const struct dirent *entry)
+{
+    if( (strcmp(entry->d_name, ".") == 0) ||
+        (strcmp(entry->d_name, "..") == 0))
+    {
+        return 0;
+    }
+    return 1;
+}
+
+//------------------------------------------------
+// Called as part of setting up skeleton services.
+// -----------------------------------------------
+int start_led_services()
+{
+    // Generic error reporter.
+    int rc = -1;
+    int num_leds = 0;
+
+    // Bus and slot where we are offering the LED dbus service.
+    sd_bus *bus_type = NULL;
+    sd_bus_slot *led_slot = NULL;
+
+    // For walking '/sys/class/leds/' looking for names of LED.
+    struct dirent **led_list;
+
+    // Get a hook onto system bus.
+    rc = sd_bus_open_system(&bus_type);
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error opening system bus.\n");
+        return rc;
+    }
+
+    num_leds = scandir("/sys/class/leds/", &led_list, led_select, alphasort);
+    if(num_leds <= 0)
+    {
+        fprintf(stderr,"No LEDs present in the system\n");
+
+        sd_bus_slot_unref(led_slot);
+        sd_bus_unref(bus_type);
+        return rc;
+    }
+
+    // For each led present, announce the service on dbus.
+    while(num_leds--)
+    {
+        char led_object[128] = {0};
+        sprintf(led_object, "%s%s","/org/openbmc/controller/led/", led_list[num_leds]->d_name);
+
+        /* Install the object */
+        rc = sd_bus_add_object_vtable(bus_type,
+                                      &led_slot,
+                                      led_object,                  /* object path */
+                                      "org.openbmc.controller.led",   /* interface name */
+                                      led_control_vtable,
+                                      NULL);
+        if (rc < 0)
+        {
+            fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
+
+            // Wipe the memory allocated for this particular entry.
+            free(led_list[num_leds]);
+            break;
+        }
+    }
+
+    // Done with all registration.
+    free(led_list);
+
+    // If we had success in adding the providers, request for a bus name.
+    if(rc == 0)
+    {
+        /* Take one in OpenBmc */
+        rc = sd_bus_request_name(bus_type, "org.openbmc.controller.led", 0);
+        if (rc < 0)
+        {
+            fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
+        }
+        else
+        {
+            for (;;)
+            {
+                /* Process requests */
+                rc = sd_bus_process(bus_type, NULL);
+                if (rc < 0)
+                {
+                    fprintf(stderr, "Failed to process bus: %s\n", strerror(-rc));
+                    break;
+                }
+                if (rc > 0)
+                {
+                    continue;
+                }
+
+                rc = sd_bus_wait(bus_type, (uint64_t) - 1);
+                if (rc < 0)
+                {
+                    fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-rc));
+                    break;
+                }
+            }
+        }
+    }
+    sd_bus_slot_unref(led_slot);
+    sd_bus_unref(bus_type);
+
+    return rc < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+int main(void)
+{
+    start_led_services();
+    return 0;
+}
-- 
2.6.4
