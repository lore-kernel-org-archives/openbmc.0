Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qp8Np21YZzDq5g
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 10:37:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xHTrFUwP; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id vv3so14655230pab.0
 for <openbmc@lists.ozlabs.org>; Sun, 17 Apr 2016 17:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LNJuXohKFyGv3sjbW7VzecSuYcc07q97EOhm8z6V82o=;
 b=xHTrFUwPSdGNbCLI5wi2HYnvgSfoGPg3czrLTLNoTYs4M21s0+RDEJLt1u9Va7a3Xh
 RYhRMQUIGkzk8e5OdiCT+NNTRL67YDxLH18LtFz8vk2+VCGkuGtbjKhOE1FXFnZyoHzc
 ZpZhMhY8Pnh9xq0PSlRfGwUHCD15tzYVOPt2pWn+9AMtY1NgwfIei1usnQDEPa791QdB
 veRpg2bVGj7ofdP2N26hY86oPUwpvUaDVLc2S4SIWCRv3Ddo18TDac5RSrKDkvZEk+R0
 SGUglhl8z023RY/AZDEFAZp6yRN2RWquhIb4ZUVqFzGkDqjNSdMKwQVBj18X4SUvzRDK
 53Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LNJuXohKFyGv3sjbW7VzecSuYcc07q97EOhm8z6V82o=;
 b=E3PhrZ3GET+vC0RbiUs6x6WK7fJDVFLUguIfzRfa+jUasH7HADhs9/Cz1qEfro8GVV
 00O/CBEEE9kIW8XHwM28trM2nedXaQTtLgIHHfU/X73jsAbLXdqIXi0Z1CSl3J2WvoZC
 Xpdi0kyA7loC20lBjvzzbGdcJy1a6hY6z9f1SxfwvAwEwC3tc4bPmGBRqgmuS4Kc0ZFU
 PY//44gi/uVncJ3t9hFYeWUK2StNwUCtXpIa7geamOJYni3IYS+B+G2I4CeEVH1Q1cbk
 l+NxRE7AwGYGl4mzkHvdIuFKtG8Rw9lGVS9YR9wXftFa5RAh2Y8ICgkVWZFV0UVgCw9d
 foTw==
X-Gm-Message-State: AOPr4FUViTOydDolYWAOUV+NpBP5OETHSSu+boVBoiw1YdW+32FxhbPVa6bd5rVdMuNp2w==
X-Received: by 10.66.221.167 with SMTP id qf7mr46008349pac.94.1460939831914;
 Sun, 17 Apr 2016 17:37:11 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i1sm78973903pfj.17.2016.04.17.17.37.09
 (version=TLSv1/SSLv3 cipher=OTHER);
 Sun, 17 Apr 2016 17:37:11 -0700 (PDT)
Date: Mon, 18 Apr 2016 10:37:01 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, Brad Bishop
 <bradleyb@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton 4/5] Fix compiler warnings for objects/*
Message-ID: <20160418103701.17476ca7@camb691>
In-Reply-To: <1460649655-15109-5-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460649655-15109-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460649655-15109-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 18 Apr 2016 00:37:15 -0000

On Thu, 14 Apr 2016 11:00:54 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Brad Bishop <bradleyb@us.ibm.com>
> 
> ---
>  includes/openbmc.h              |  2 +-
>  objects/board_vpd_obj.c         |  3 +-
>  objects/button_power_obj.c      |  4 +--
>  objects/button_reset_obj.c      |  4 +--
>  objects/control_host_obj.c      |  1 -
>  objects/flash_bios_obj.c        | 65 +++++------------------------------------
>  objects/flasher_obj.c           | 46 +----------------------------
>  objects/host_watchdog_obj.c     |  3 +-
>  objects/hwmons_barreleye.c      |  5 ++--
>  objects/led_controller.c        | 17 +++++++----
>  objects/pcie_slot_present_obj.c |  6 +---
>  objects/power_control_obj.c     |  3 --
>  12 files changed, 28 insertions(+), 131 deletions(-)
> 
> diff --git a/includes/openbmc.h b/includes/openbmc.h
> index a6d420b..e338dda 100644
> --- a/includes/openbmc.h
> +++ b/includes/openbmc.h
> @@ -20,7 +20,7 @@
>  #ifdef __arm__
>  static inline void devmem(void* addr, uint32_t val)
>  {
> -	printf("devmem 0x%08x = 0x%08x\n",addr,val);
> +	printf("devmem 0x%08x = 0x%08x\n",(uint32_t)addr,val);

You know printf can print pointers directly with %p? Seems nicer than a
cast...

>          asm volatile("" : : : "memory");
>          *(volatile uint32_t *)addr = val;
>  }
> diff --git a/objects/board_vpd_obj.c b/objects/board_vpd_obj.c
> index a6576db..c64c250 100644
> --- a/objects/board_vpd_obj.c
> +++ b/objects/board_vpd_obj.c
> @@ -12,7 +12,6 @@ main(gint argc, gchar *argv[])
>  	GDBusProxy *p;
>  	GError *error;
>  	GVariant *parm;
> -	GVariant *result;
>  
>  	loop = g_main_loop_new(NULL, FALSE);
>  
> @@ -44,7 +43,7 @@ main(gint argc, gchar *argv[])
>  	parm = g_variant_new("(v)",dict);
>  
>  	error = NULL;
> -	result = g_dbus_proxy_call_sync(p,
> +	(void)g_dbus_proxy_call_sync(p,

Are we compiling with the option to warn about ignoring return values? I'm not
strictly opposed to explicitly stating in the code that we ignore return values
like this but I'm a bigger fan of consistency. Is is something we want to push
for?

>  			"update",
>  			parm,
>  			G_DBUS_CALL_FLAGS_NONE,
> diff --git a/objects/button_power_obj.c b/objects/button_power_obj.c
> index f9a2b09..d1dbef0 100644
> --- a/objects/button_power_obj.c
> +++ b/objects/button_power_obj.c
> @@ -44,7 +44,7 @@ on_button_interrupt( GIOChannel *channel,
>  	gchar buf[2];
>  	buf[1] = '\0';
>  	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
> -	GIOStatus rc = g_io_channel_read_chars( channel,
> +	(void)g_io_channel_read_chars(channel,
>  			buf, 1,
>  			&bytes_read,
>  			&error );
> @@ -84,9 +84,7 @@ on_bus_acquired(GDBusConnection *connection,
>  {
>  	ObjectSkeleton *object;
>  	//g_print ("Acquired a message bus connection: %s\n",name);
> -	cmdline *cmd = user_data;
>  	manager = g_dbus_object_manager_server_new(dbus_object_path);
> -	int i=0;
>  	gchar *s;
>  	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
>  	object = object_skeleton_new(s);
> diff --git a/objects/button_reset_obj.c b/objects/button_reset_obj.c
> index 6e915a5..22e98c5 100644
> --- a/objects/button_reset_obj.c
> +++ b/objects/button_reset_obj.c
> @@ -44,7 +44,7 @@ on_button_interrupt( GIOChannel *channel,
>  	gchar buf[2];
>  	buf[1] = '\0';
>  	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
> -	GIOStatus rc = g_io_channel_read_chars( channel,
> +	(void)g_io_channel_read_chars( channel,
>  			buf, 1,
>  			&bytes_read,
>  			&error );
> @@ -84,9 +84,7 @@ on_bus_acquired(GDBusConnection *connection,
>  {
>  	ObjectSkeleton *object;
>  	//g_print ("Acquired a message bus connection: %s\n",name);
> -	cmdline *cmd = user_data;
>  	manager = g_dbus_object_manager_server_new(dbus_object_path);
> -	int i=0;
>  	gchar *s;
>  	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
>  	object = object_skeleton_new(s);
> diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
> index 3e7f2ae..e8d1745 100644
> --- a/objects/control_host_obj.c
> +++ b/objects/control_host_obj.c
> @@ -182,7 +182,6 @@ on_bus_acquired(GDBusConnection *connection,
>  {
>  	ObjectSkeleton *object;
>  	//g_print ("Acquired a message bus connection: %s\n",name);
> -	cmdline *cmd = user_data;
>  	manager = g_dbus_object_manager_server_new(dbus_object_path);
>  
>  	gchar *s;
> diff --git a/objects/flash_bios_obj.c b/objects/flash_bios_obj.c
> index e661545..a46c5cb 100644
> --- a/objects/flash_bios_obj.c
> +++ b/objects/flash_bios_obj.c
> @@ -1,6 +1,8 @@
>  #include <stdio.h>
>  #include <stdbool.h>
>  #include <string.h>
> +#include <sys/wait.h>
> +#include <sys/types.h>
>  #include "interfaces/openbmc_intf.h"
>  #include "openbmc.h"
>  #include "object_mapper.h"
> @@ -9,8 +11,6 @@
>  static const gchar* dbus_object_path = "/org/openbmc/control/flash";
>  static const gchar* dbus_name = "org.openbmc.control.Flash";
>  static const gchar* FLASHER_BIN = "flasher.exe";
> -static const gchar* DLOAD_BUS = "org.openbmc.managers.Download";
> -static const gchar* DLOAD_OBJ = "/org/openbmc/managers/Download";
>  
>  static GDBusObjectManagerServer *manager = NULL;
>  
> @@ -142,9 +142,8 @@ on_error(Flash *flash,
>  		gchar* error_msg,
>  		gpointer user_data)
>  {
> -	int rc = 0;
>  	SharedResource *lock = object_get_shared_resource((Object*)user_data);
> -	gboolean locked = shared_resource_get_lock(lock);
> +	(void)shared_resource_get_lock(lock);
>  	flash_set_status(flash, error_msg);
>  	flash_complete_error(flash,invocation);
>  	printf("ERROR: %s.  Clearing locks\n",error_msg);
> @@ -161,7 +160,7 @@ on_done(Flash *flash,
>  {
>  	int rc = 0;
>  	SharedResource *lock = object_get_shared_resource((Object*)user_data);
> -	gboolean locked = shared_resource_get_lock(lock);
> +	(void)shared_resource_get_lock(lock);
>  	flash_set_status(flash, "Flash Done");
>  	flash_complete_done(flash,invocation);
>  	printf("Flash Done. Clearing locks\n");
> @@ -221,9 +220,9 @@ on_flash_progress(GDBusConnection* connection,
>  		gpointer user_data)
>  {
>  	Flash *flash = object_get_flash((Object*)user_data);
> -	SharedResource *lock = object_get_shared_resource((Object*)user_data);
> +	(void)object_get_shared_resource((Object*)user_data);
>  	GVariantIter *iter = g_variant_iter_new(parameters);
> -	GVariant* v_filename = g_variant_iter_next_value(iter);
> +	(void)g_variant_iter_next_value(iter);
>  	GVariant* v_progress = g_variant_iter_next_value(iter);
>  
>  	uint8_t progress = g_variant_get_byte(v_progress);
> @@ -235,55 +234,6 @@ on_flash_progress(GDBusConnection* connection,
>  }
>  
>  static void
> -on_flash_done(GDBusConnection* connection,
> -		const gchar* sender_name,
> -		const gchar* object_path,
> -		const gchar* interface_name,
> -		const gchar* signal_name,
> -		GVariant* parameters,
> -		gpointer user_data)
> -{
> -	Flash *flash = object_get_flash((Object*)user_data);
> -	SharedResource *lock = object_get_shared_resource((Object*)user_data);
> -	printf("Flash succeeded; unlocking flash\n");
> -	shared_resource_set_lock(lock,false);
> -	shared_resource_set_name(lock,"");
> -	flash_set_status(flash,"Flash Done");
> -}
> -
> -static void
> -on_flash_error(GDBusConnection* connection,
> -		const gchar* sender_name,
> -		const gchar* object_path,
> -		const gchar* interface_name,
> -		const gchar* signal_name,
> -		GVariant* parameters,
> -		gpointer user_data)
> -{
> -	Flash *flash = object_get_flash((Object*)user_data);
> -	SharedResource *lock = object_get_shared_resource((Object*)user_data);
> -	printf("Flash Error; unlocking flash\n");
> -	shared_resource_set_lock(lock,false);
> -	shared_resource_set_name(lock,"");
> -}
> -
> -static void
> -on_download_error(GDBusConnection* connection,
> -		const gchar* sender_name,
> -		const gchar* object_path,
> -		const gchar* interface_name,
> -		const gchar* signal_name,
> -		GVariant* parameters,
> -		gpointer user_data)
> -{
> -	Flash *flash = object_get_flash((Object*)user_data);
> -	SharedResource *lock = object_get_shared_resource((Object*)user_data);
> -	printf("ERROR: FlashBios:  Download error; clearing flash lock\n");
> -	shared_resource_set_lock(lock,false);
> -	shared_resource_set_name(lock,"");
> -}
> -
> -static void
>  on_bus_acquired(GDBusConnection *connection,
>  		const gchar *name,
>  		gpointer user_data)
> @@ -296,8 +246,7 @@ on_bus_acquired(GDBusConnection *connection,
>  	//TODO: don't use fixed buffer
>  	char flasher_path[512];
>  	memset(flasher_path, '\0', sizeof(flasher_path));
> -	bool found = false;
> -	gchar *flasher_file;
> +	gchar *flasher_file = NULL;
>  	int c = strlen(cmd->argv[0]);
>  	while(c>0)  
>  	{
> diff --git a/objects/flasher_obj.c b/objects/flasher_obj.c
> index 2d80847..1f1e5a5 100644
> --- a/objects/flasher_obj.c
> +++ b/objects/flasher_obj.c
> @@ -24,7 +24,6 @@
>  #include "includes/openbmc.h"
>  
>  static const gchar* dbus_object_path = "/org/openbmc/control";
> -static const gchar* dbus_object_name = "Flasher_0";
>  static const gchar* dbus_name = "org.openbmc.control.Flasher";
>  
>  static GDBusObjectManagerServer *manager = NULL;
> @@ -33,10 +32,7 @@ static GDBusObjectManagerServer *manager = NULL;
>  
>  #define PFLASH_VERSION	"0.8.6"
>  
> -static bool must_confirm = false;
> -static bool dummy_run;
>  static bool need_relock;
> -static bool bmc_flash;
>  #ifdef __powerpc__
>  static bool using_sfc;
>  #endif
> @@ -54,7 +50,6 @@ static int32_t			ffs_index = -1;
>  static uint8_t FLASH_OK = 0;
>  static uint8_t FLASH_ERROR = 0x01;
>  static uint8_t FLASH_SETUP_ERROR = 0x02;
> -static struct blocklevel_device *bl;
>  
>  static int
>  erase_chip(void)
> @@ -80,7 +75,6 @@ flash_message(GDBusConnection* connection,char* obj_path,char* method, char* err
>  	GDBusProxy *proxy;
>  	GError *error;
>  	GVariant *parm = NULL;
> -	GVariant *result;
>  	error = NULL;
>  	proxy = g_dbus_proxy_new_sync(connection,
>  			G_DBUS_PROXY_FLAGS_NONE,
> @@ -96,7 +90,7 @@ flash_message(GDBusConnection* connection,char* obj_path,char* method, char* err
>  	if(strcmp(method,"error")==0) {
>  		parm = g_variant_new("(s)",error_msg);
>  	}
> -	result = g_dbus_proxy_call_sync(proxy,
> +	(void)g_dbus_proxy_call_sync(proxy,
>  			method,
>  			parm,
>  			G_DBUS_CALL_FLAGS_NONE,
> @@ -167,44 +161,6 @@ program_file(FlashControl* flash_control, const char *file, uint32_t start, uint
>  }
>  
>  static void
> -do_read_file(const char *file, uint32_t start, uint32_t size)
> -{
> -	int fd, rc;
> -	ssize_t len;
> -	uint32_t done = 0;
> -
> -	fd = open(file, O_WRONLY | O_TRUNC | O_CREAT, 00666);
> -	if(fd == -1) {
> -		perror("Failed to open file");
> -		exit(1);
> -	}
> -	printf("Reading to \"%s\" from 0x%08x..0x%08x !\n",
> -			file, start, size);
> -
> -	progress_init(size >> 8);
> -	while(size) {
> -		len = size > FILE_BUF_SIZE ? FILE_BUF_SIZE : size;
> -		rc = flash_read(fl_chip, start, file_buf, len);
> -		if(rc) {
> -			fprintf(stderr, "Flash read error %d for"
> -					" chunk at 0x%08x\n", rc, start);
> -			exit(1);
> -		}
> -		rc = write(fd, file_buf, len);
> -		if(rc < 0) {
> -			perror("Error writing file");
> -			exit(1);
> -		}
> -		start += len;
> -		size -= len;
> -		done += len;
> -		progress_tick(done >> 8);
> -	}
> -	progress_end();
> -	close(fd);
> -}
> -
> -static void
>  flash_access_cleanup_bmc(void)
>  {
>  	if(ffsh)
> diff --git a/objects/host_watchdog_obj.c b/objects/host_watchdog_obj.c
> index 0b3b149..2e0ef15 100644
> --- a/objects/host_watchdog_obj.c
> +++ b/objects/host_watchdog_obj.c
> @@ -40,6 +40,7 @@ remove_watchdog(void)
>  		g_source_remove(watchdogid);
>  		watchdogid = 0;
>  	}
> +	return TRUE;
>  }
>  
>  static gboolean
> @@ -51,6 +52,7 @@ set_poll_interval(Watchdog *wd,
>  	g_print("Setting watchdog poll interval to: %d\n", interval);
>  	watchdog_set_poll_interval(wd, interval);
>  	watchdog_complete_set(wd,invocation);
> +	return TRUE;
>  }
>  
>  static gboolean
> @@ -93,7 +95,6 @@ on_bus_acquired(GDBusConnection *connection,
>  		const gchar *name,
>  		gpointer user_data)
>  {
> -	cmdline *cmd = user_data;
>  	manager = g_dbus_object_manager_server_new(dbus_object_path);
>  	gchar *s;
>  	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
> diff --git a/objects/hwmons_barreleye.c b/objects/hwmons_barreleye.c
> index 06b1554..b9dfff6 100644
> --- a/objects/hwmons_barreleye.c
> +++ b/objects/hwmons_barreleye.c
> @@ -1,5 +1,6 @@
>  #include "interfaces/openbmc_intf.h"
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <fcntl.h>
>  #include "openbmc.h"
>  #include "gpio.h"
> @@ -70,7 +71,7 @@ poll_hwmon(gpointer user_data)
>  
>  			}
>  			guint32 value = atoi(buf)/scale;
> -			GVariant* v = NEW_VARIANT_U(value);
> +			(void)NEW_VARIANT_U(value);
>  			GVariant* old_value = sensor_value_get_value(sensor);
>  			bool do_set = false;
>  			if(old_value == NULL)
> @@ -130,8 +131,6 @@ on_bus_acquired(GDBusConnection *connection,
>  {
>  	ObjectSkeleton *object;
>  
> -	cmdline *cmd = user_data;
> -
>  	manager = g_dbus_object_manager_server_new(dbus_object_path);
>  	int i = 0;
>  	for(i=0;i<NUM_HWMONS;i++)
> diff --git a/objects/led_controller.c b/objects/led_controller.c
> index 1f542e1..96e7ad1 100644
> --- a/objects/led_controller.c
> +++ b/objects/led_controller.c
> @@ -5,6 +5,11 @@
>  #include <dirent.h>
>  #include <systemd/sd-bus.h>
>  
> +static int led_stable_state_function(const char *, const char *);
> +static int led_default_blink(const char *, const char *);
> +static int read_led(const char *, const char *, void *, const size_t);
> +static int led_custom_blink(const char *, sd_bus_message *);
> +
>  /*
>   * These are control files that are present for each led under
>   *'/sys/class/leds/<led_name>/' which are used to trigger action
> @@ -156,8 +161,8 @@ led_function_router(sd_bus_message *msg, void *user_data,
>   * Turn On or Turn Off the LED
>   * --------------------------------------------------------------
>   */
> -int
> -led_stable_state_function(char *led_name, char *led_function)
> +static int
> +led_stable_state_function(const char *led_name, const char *led_function)
>  {
>  	/* Generic error reporter. */
>  	int rc = -1;
> @@ -244,8 +249,8 @@ blink_led(const char *led_name, const char *on_duration, const char *off_duratio
>   * Default blink action on the LED.
>   * ----------------------------------------------------
>   */
> -int
> -led_default_blink(char *led_name, char *blink_type)
> +static int
> +led_default_blink(const char *led_name, const char *blink_type)
>  {
>  	/* Generic error reporter */
>  	int rc = -1;
> @@ -281,7 +286,7 @@ led_default_blink(char *led_name, char *blink_type)
>   * Blinks at user defined 'on' and 'off' intervals.
>   * -------------------------------------------------
>   */
> -int
> +static int
>  led_custom_blink(const char *led_name, sd_bus_message *msg)
>  {
>  	/* Generic error reporter. */
> @@ -342,7 +347,7 @@ led_custom_blink(const char *led_name, sd_bus_message *msg)
>   * size -or- entire contents of file whichever is smaller
>   * ----------------------------------------------------------------
>   */
> -int
> +static int
>  read_led(const char *name, const char *ctrl_file,
>  		void *value, const size_t len)
>  {
> diff --git a/objects/pcie_slot_present_obj.c b/objects/pcie_slot_present_obj.c
> index a71ba2d..0c9258e 100644
> --- a/objects/pcie_slot_present_obj.c
> +++ b/objects/pcie_slot_present_obj.c
> @@ -87,7 +87,6 @@ update_fru_obj(GDBusConnection* connection, object_info* obj_info, const char* p
>  	GDBusProxy *proxy;
>  	GError *error;
>  	GVariant *parm;
> -	GVariant *result;
>  
>  	error = NULL;
>  	proxy = g_dbus_proxy_new_sync(connection,
> @@ -103,7 +102,7 @@ update_fru_obj(GDBusConnection* connection, object_info* obj_info, const char* p
>  	error = NULL;
>  	parm = g_variant_new("(s)",present);
>  
> -	result = g_dbus_proxy_call_sync(proxy,
> +	(void)g_dbus_proxy_call_sync(proxy,
>  			"setPresent",
>  			parm,
>  			G_DBUS_CALL_FLAGS_NONE,
> @@ -121,8 +120,6 @@ main(gint argc, gchar *argv[])
>  	GDBusConnection *c;
>  	GDBusProxy *sys_proxy;
>  	GError *error;
> -	GVariant *parm;
> -	GVariant *result;
>  
>  	loop = g_main_loop_new(NULL, FALSE);
>  
> @@ -146,7 +143,6 @@ main(gint argc, gchar *argv[])
>  	{
>  		object_info obj_info;
>  		uint8_t present;
> -		char* chr_present;
>  		do {
>  			rc = get_object(sys_proxy,&slots[i],&obj_info);
>  			if(rc) { break; }
> diff --git a/objects/power_control_obj.c b/objects/power_control_obj.c
> index 72947f5..da69413 100644
> --- a/objects/power_control_obj.c
> +++ b/objects/power_control_obj.c
> @@ -36,8 +36,6 @@ poll_pgood(gpointer user_data)
>  	Control* control = object_get_control((Object*)user_data);
>  
>  	//send the heartbeat
> -	const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
> -
>  	guint poll_int = control_get_poll_interval(control);
>  	if(poll_int == 0)
>  	{
> @@ -119,7 +117,6 @@ on_set_power_state(ControlPower *pwr,
>  		gpointer user_data)
>  {
>  	Control* control = object_get_control((Object*)user_data);
> -	const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
>  	if(state > 1)
>  	{
>  		g_dbus_method_invocation_return_dbus_error(invocation,
