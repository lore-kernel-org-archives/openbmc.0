Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qrLPG3KfKzDqcc
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 00:15:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=KfiaexFa; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 217762344A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1461248111;
 bh=aFooC7nnYvQkmS+BVkuilKaJgyP3Jm3I7DGW3diVIdE=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=KfiaexFaPynxr4FAz2djH22pULuB4s//z5oqtxDV0P0hCLAi9fpfxeQMwUYp1NKdX
 rzA34mziSbKRqHWuhJaksD9o7RZ1BU8ZH4i9r2FP6FidYT7wlr5X4Xph/9xxGUF/kM
 bgT1gXDiYuFYKoCee8nKGgugNjEYEOmqM1MkxZo0=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id D58CD23409;
 Thu, 21 Apr 2016 10:15:06 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH skeleton 4/5] Fix compiler warnings for objects/*
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20160418103701.17476ca7@camb691>
Date: Thu, 21 Apr 2016 10:15:06 -0400
Cc: Brad Bishop <bradleyb@us.ibm.com>,
 OpenBMC Patches <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <89D86868-5646-49A1-9282-FAC28418FC21@fuzziesquirrel.com>
References: <1460649655-15109-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460649655-15109-5-git-send-email-openbmc-patches@stwcx.xyz>
 <20160418103701.17476ca7@camb691>
To: Cyril Bur <cyrilbur@gmail.com>
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Thu, 21 Apr 2016 14:15:15 -0000

Thanks Cyril!


> On Apr 17, 2016, at 8:37 PM, Cyril Bur <cyrilbur@gmail.com> wrote
> e:
>=20
> On Thu, 14 Apr 2016 11:00:54 -0500
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
>=20
>> From: Brad Bishop <bradleyb@us.ibm.com>
>>=20
>> ---
>> includes/openbmc.h              |  2 +-
>> objects/board_vpd_obj.c         |  3 +-
>> objects/button_power_obj.c      |  4 +--
>> objects/button_reset_obj.c      |  4 +--
>> objects/control_host_obj.c      |  1 -
>> objects/flash_bios_obj.c        | 65 =
+++++------------------------------------
>> objects/flasher_obj.c           | 46 +----------------------------
>> objects/host_watchdog_obj.c     |  3 +-
>> objects/hwmons_barreleye.c      |  5 ++--
>> objects/led_controller.c        | 17 +++++++----
>> objects/pcie_slot_present_obj.c |  6 +---
>> objects/power_control_obj.c     |  3 --
>> 12 files changed, 28 insertions(+), 131 deletions(-)
>>=20
>> diff --git a/includes/openbmc.h b/includes/openbmc.h
>> index a6d420b..e338dda 100644
>> --- a/includes/openbmc.h
>> +++ b/includes/openbmc.h
>> @@ -20,7 +20,7 @@
>> #ifdef __arm__
>> static inline void devmem(void* addr, uint32_t val)
>> {
>> -	printf("devmem 0x%08x =3D 0x%08x\n",addr,val);
>> +	printf("devmem 0x%08x =3D 0x%08x\n",(uint32_t)addr,val);
>=20
> You know printf can print pointers directly with %p? Seems nicer than =
a
> cast=E2=80=A6

agreed.

>=20
>>         asm volatile("" : : : "memory");
>>         *(volatile uint32_t *)addr =3D val;
>> }
>> diff --git a/objects/board_vpd_obj.c b/objects/board_vpd_obj.c
>> index a6576db..c64c250 100644
>> --- a/objects/board_vpd_obj.c
>> +++ b/objects/board_vpd_obj.c
>> @@ -12,7 +12,6 @@ main(gint argc, gchar *argv[])
>> 	GDBusProxy *p;
>> 	GError *error;
>> 	GVariant *parm;
>> -	GVariant *result;
>>=20
>> 	loop =3D g_main_loop_new(NULL, FALSE);
>>=20
>> @@ -44,7 +43,7 @@ main(gint argc, gchar *argv[])
>> 	parm =3D g_variant_new("(v)",dict);
>>=20
>> 	error =3D NULL;
>> -	result =3D g_dbus_proxy_call_sync(p,
>> +	(void)g_dbus_proxy_call_sync(p,
>=20
> Are we compiling with the option to warn about ignoring return values? =
I'm not
> strictly opposed to explicitly stating in the code that we ignore =
return values
> like this but I'm a bigger fan of consistency. Is is something we want =
to push
> for?

-Wall doesn=E2=80=99t seem to mind if the casts aren=E2=80=99t there.  =
Removed.

>=20
>> 			"update",
>> 			parm,
>> 			G_DBUS_CALL_FLAGS_NONE,
>> diff --git a/objects/button_power_obj.c b/objects/button_power_obj.c
>> index f9a2b09..d1dbef0 100644
>> --- a/objects/button_power_obj.c
>> +++ b/objects/button_power_obj.c
>> @@ -44,7 +44,7 @@ on_button_interrupt( GIOChannel *channel,
>> 	gchar buf[2];
>> 	buf[1] =3D '\0';
>> 	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
>> -	GIOStatus rc =3D g_io_channel_read_chars( channel,
>> +	(void)g_io_channel_read_chars(channel,
>> 			buf, 1,
>> 			&bytes_read,
>> 			&error );
>> @@ -84,9 +84,7 @@ on_bus_acquired(GDBusConnection *connection,
>> {
>> 	ObjectSkeleton *object;
>> 	//g_print ("Acquired a message bus connection: %s\n",name);
>> -	cmdline *cmd =3D user_data;
>> 	manager =3D g_dbus_object_manager_server_new(dbus_object_path);
>> -	int i=3D0;
>> 	gchar *s;
>> 	s =3D g_strdup_printf("%s/%s",dbus_object_path,instance_name);
>> 	object =3D object_skeleton_new(s);
>> diff --git a/objects/button_reset_obj.c b/objects/button_reset_obj.c
>> index 6e915a5..22e98c5 100644
>> --- a/objects/button_reset_obj.c
>> +++ b/objects/button_reset_obj.c
>> @@ -44,7 +44,7 @@ on_button_interrupt( GIOChannel *channel,
>> 	gchar buf[2];
>> 	buf[1] =3D '\0';
>> 	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
>> -	GIOStatus rc =3D g_io_channel_read_chars( channel,
>> +	(void)g_io_channel_read_chars( channel,
>> 			buf, 1,
>> 			&bytes_read,
>> 			&error );
>> @@ -84,9 +84,7 @@ on_bus_acquired(GDBusConnection *connection,
>> {
>> 	ObjectSkeleton *object;
>> 	//g_print ("Acquired a message bus connection: %s\n",name);
>> -	cmdline *cmd =3D user_data;
>> 	manager =3D g_dbus_object_manager_server_new(dbus_object_path);
>> -	int i=3D0;
>> 	gchar *s;
>> 	s =3D g_strdup_printf("%s/%s",dbus_object_path,instance_name);
>> 	object =3D object_skeleton_new(s);
>> diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
>> index 3e7f2ae..e8d1745 100644
>> --- a/objects/control_host_obj.c
>> +++ b/objects/control_host_obj.c
>> @@ -182,7 +182,6 @@ on_bus_acquired(GDBusConnection *connection,
>> {
>> 	ObjectSkeleton *object;
>> 	//g_print ("Acquired a message bus connection: %s\n",name);
>> -	cmdline *cmd =3D user_data;
>> 	manager =3D g_dbus_object_manager_server_new(dbus_object_path);
>>=20
>> 	gchar *s;
>> diff --git a/objects/flash_bios_obj.c b/objects/flash_bios_obj.c
>> index e661545..a46c5cb 100644
>> --- a/objects/flash_bios_obj.c
>> +++ b/objects/flash_bios_obj.c
>> @@ -1,6 +1,8 @@
>> #include <stdio.h>
>> #include <stdbool.h>
>> #include <string.h>
>> +#include <sys/wait.h>
>> +#include <sys/types.h>
>> #include "interfaces/openbmc_intf.h"
>> #include "openbmc.h"
>> #include "object_mapper.h"
>> @@ -9,8 +11,6 @@
>> static const gchar* dbus_object_path =3D =
"/org/openbmc/control/flash";
>> static const gchar* dbus_name =3D "org.openbmc.control.Flash";
>> static const gchar* FLASHER_BIN =3D "flasher.exe";
>> -static const gchar* DLOAD_BUS =3D "org.openbmc.managers.Download";
>> -static const gchar* DLOAD_OBJ =3D "/org/openbmc/managers/Download";
>>=20
>> static GDBusObjectManagerServer *manager =3D NULL;
>>=20
>> @@ -142,9 +142,8 @@ on_error(Flash *flash,
>> 		gchar* error_msg,
>> 		gpointer user_data)
>> {
>> -	int rc =3D 0;
>> 	SharedResource *lock =3D =
object_get_shared_resource((Object*)user_data);
>> -	gboolean locked =3D shared_resource_get_lock(lock);
>> +	(void)shared_resource_get_lock(lock);
>> 	flash_set_status(flash, error_msg);
>> 	flash_complete_error(flash,invocation);
>> 	printf("ERROR: %s.  Clearing locks\n",error_msg);
>> @@ -161,7 +160,7 @@ on_done(Flash *flash,
>> {
>> 	int rc =3D 0;
>> 	SharedResource *lock =3D =
object_get_shared_resource((Object*)user_data);
>> -	gboolean locked =3D shared_resource_get_lock(lock);
>> +	(void)shared_resource_get_lock(lock);
>> 	flash_set_status(flash, "Flash Done");
>> 	flash_complete_done(flash,invocation);
>> 	printf("Flash Done. Clearing locks\n");
>> @@ -221,9 +220,9 @@ on_flash_progress(GDBusConnection* connection,
>> 		gpointer user_data)
>> {
>> 	Flash *flash =3D object_get_flash((Object*)user_data);
>> -	SharedResource *lock =3D =
object_get_shared_resource((Object*)user_data);
>> +	(void)object_get_shared_resource((Object*)user_data);
>> 	GVariantIter *iter =3D g_variant_iter_new(parameters);
>> -	GVariant* v_filename =3D g_variant_iter_next_value(iter);
>> +	(void)g_variant_iter_next_value(iter);
>> 	GVariant* v_progress =3D g_variant_iter_next_value(iter);
>>=20
>> 	uint8_t progress =3D g_variant_get_byte(v_progress);
>> @@ -235,55 +234,6 @@ on_flash_progress(GDBusConnection* connection,
>> }
>>=20
>> static void
>> -on_flash_done(GDBusConnection* connection,
>> -		const gchar* sender_name,
>> -		const gchar* object_path,
>> -		const gchar* interface_name,
>> -		const gchar* signal_name,
>> -		GVariant* parameters,
>> -		gpointer user_data)
>> -{
>> -	Flash *flash =3D object_get_flash((Object*)user_data);
>> -	SharedResource *lock =3D =
object_get_shared_resource((Object*)user_data);
>> -	printf("Flash succeeded; unlocking flash\n");
>> -	shared_resource_set_lock(lock,false);
>> -	shared_resource_set_name(lock,"");
>> -	flash_set_status(flash,"Flash Done");
>> -}
>> -
>> -static void
>> -on_flash_error(GDBusConnection* connection,
>> -		const gchar* sender_name,
>> -		const gchar* object_path,
>> -		const gchar* interface_name,
>> -		const gchar* signal_name,
>> -		GVariant* parameters,
>> -		gpointer user_data)
>> -{
>> -	Flash *flash =3D object_get_flash((Object*)user_data);
>> -	SharedResource *lock =3D =
object_get_shared_resource((Object*)user_data);
>> -	printf("Flash Error; unlocking flash\n");
>> -	shared_resource_set_lock(lock,false);
>> -	shared_resource_set_name(lock,"");
>> -}
>> -
>> -static void
>> -on_download_error(GDBusConnection* connection,
>> -		const gchar* sender_name,
>> -		const gchar* object_path,
>> -		const gchar* interface_name,
>> -		const gchar* signal_name,
>> -		GVariant* parameters,
>> -		gpointer user_data)
>> -{
>> -	Flash *flash =3D object_get_flash((Object*)user_data);
>> -	SharedResource *lock =3D =
object_get_shared_resource((Object*)user_data);
>> -	printf("ERROR: FlashBios:  Download error; clearing flash =
lock\n");
>> -	shared_resource_set_lock(lock,false);
>> -	shared_resource_set_name(lock,"");
>> -}
>> -
>> -static void
>> on_bus_acquired(GDBusConnection *connection,
>> 		const gchar *name,
>> 		gpointer user_data)
>> @@ -296,8 +246,7 @@ on_bus_acquired(GDBusConnection *connection,
>> 	//TODO: don't use fixed buffer
>> 	char flasher_path[512];
>> 	memset(flasher_path, '\0', sizeof(flasher_path));
>> -	bool found =3D false;
>> -	gchar *flasher_file;
>> +	gchar *flasher_file =3D NULL;
>> 	int c =3D strlen(cmd->argv[0]);
>> 	while(c>0) =20
>> 	{
>> diff --git a/objects/flasher_obj.c b/objects/flasher_obj.c
>> index 2d80847..1f1e5a5 100644
>> --- a/objects/flasher_obj.c
>> +++ b/objects/flasher_obj.c
>> @@ -24,7 +24,6 @@
>> #include "includes/openbmc.h"
>>=20
>> static const gchar* dbus_object_path =3D "/org/openbmc/control";
>> -static const gchar* dbus_object_name =3D "Flasher_0";
>> static const gchar* dbus_name =3D "org.openbmc.control.Flasher";
>>=20
>> static GDBusObjectManagerServer *manager =3D NULL;
>> @@ -33,10 +32,7 @@ static GDBusObjectManagerServer *manager =3D NULL;
>>=20
>> #define PFLASH_VERSION	"0.8.6"
>>=20
>> -static bool must_confirm =3D false;
>> -static bool dummy_run;
>> static bool need_relock;
>> -static bool bmc_flash;
>> #ifdef __powerpc__
>> static bool using_sfc;
>> #endif
>> @@ -54,7 +50,6 @@ static int32_t			ffs_index =3D =
-1;
>> static uint8_t FLASH_OK =3D 0;
>> static uint8_t FLASH_ERROR =3D 0x01;
>> static uint8_t FLASH_SETUP_ERROR =3D 0x02;
>> -static struct blocklevel_device *bl;
>>=20
>> static int
>> erase_chip(void)
>> @@ -80,7 +75,6 @@ flash_message(GDBusConnection* connection,char* =
obj_path,char* method, char* err
>> 	GDBusProxy *proxy;
>> 	GError *error;
>> 	GVariant *parm =3D NULL;
>> -	GVariant *result;
>> 	error =3D NULL;
>> 	proxy =3D g_dbus_proxy_new_sync(connection,
>> 			G_DBUS_PROXY_FLAGS_NONE,
>> @@ -96,7 +90,7 @@ flash_message(GDBusConnection* connection,char* =
obj_path,char* method, char* err
>> 	if(strcmp(method,"error")=3D=3D0) {
>> 		parm =3D g_variant_new("(s)",error_msg);
>> 	}
>> -	result =3D g_dbus_proxy_call_sync(proxy,
>> +	(void)g_dbus_proxy_call_sync(proxy,
>> 			method,
>> 			parm,
>> 			G_DBUS_CALL_FLAGS_NONE,
>> @@ -167,44 +161,6 @@ program_file(FlashControl* flash_control, const =
char *file, uint32_t start, uint
>> }
>>=20
>> static void
>> -do_read_file(const char *file, uint32_t start, uint32_t size)
>> -{
>> -	int fd, rc;
>> -	ssize_t len;
>> -	uint32_t done =3D 0;
>> -
>> -	fd =3D open(file, O_WRONLY | O_TRUNC | O_CREAT, 00666);
>> -	if(fd =3D=3D -1) {
>> -		perror("Failed to open file");
>> -		exit(1);
>> -	}
>> -	printf("Reading to \"%s\" from 0x%08x..0x%08x !\n",
>> -			file, start, size);
>> -
>> -	progress_init(size >> 8);
>> -	while(size) {
>> -		len =3D size > FILE_BUF_SIZE ? FILE_BUF_SIZE : size;
>> -		rc =3D flash_read(fl_chip, start, file_buf, len);
>> -		if(rc) {
>> -			fprintf(stderr, "Flash read error %d for"
>> -					" chunk at 0x%08x\n", rc, =
start);
>> -			exit(1);
>> -		}
>> -		rc =3D write(fd, file_buf, len);
>> -		if(rc < 0) {
>> -			perror("Error writing file");
>> -			exit(1);
>> -		}
>> -		start +=3D len;
>> -		size -=3D len;
>> -		done +=3D len;
>> -		progress_tick(done >> 8);
>> -	}
>> -	progress_end();
>> -	close(fd);
>> -}
>> -
>> -static void
>> flash_access_cleanup_bmc(void)
>> {
>> 	if(ffsh)
>> diff --git a/objects/host_watchdog_obj.c =
b/objects/host_watchdog_obj.c
>> index 0b3b149..2e0ef15 100644
>> --- a/objects/host_watchdog_obj.c
>> +++ b/objects/host_watchdog_obj.c
>> @@ -40,6 +40,7 @@ remove_watchdog(void)
>> 		g_source_remove(watchdogid);
>> 		watchdogid =3D 0;
>> 	}
>> +	return TRUE;
>> }
>>=20
>> static gboolean
>> @@ -51,6 +52,7 @@ set_poll_interval(Watchdog *wd,
>> 	g_print("Setting watchdog poll interval to: %d\n", interval);
>> 	watchdog_set_poll_interval(wd, interval);
>> 	watchdog_complete_set(wd,invocation);
>> +	return TRUE;
>> }
>>=20
>> static gboolean
>> @@ -93,7 +95,6 @@ on_bus_acquired(GDBusConnection *connection,
>> 		const gchar *name,
>> 		gpointer user_data)
>> {
>> -	cmdline *cmd =3D user_data;
>> 	manager =3D g_dbus_object_manager_server_new(dbus_object_path);
>> 	gchar *s;
>> 	s =3D g_strdup_printf("%s/%s",dbus_object_path,instance_name);
>> diff --git a/objects/hwmons_barreleye.c b/objects/hwmons_barreleye.c
>> index 06b1554..b9dfff6 100644
>> --- a/objects/hwmons_barreleye.c
>> +++ b/objects/hwmons_barreleye.c
>> @@ -1,5 +1,6 @@
>> #include "interfaces/openbmc_intf.h"
>> #include <stdio.h>
>> +#include <stdlib.h>
>> #include <fcntl.h>
>> #include "openbmc.h"
>> #include "gpio.h"
>> @@ -70,7 +71,7 @@ poll_hwmon(gpointer user_data)
>>=20
>> 			}
>> 			guint32 value =3D atoi(buf)/scale;
>> -			GVariant* v =3D NEW_VARIANT_U(value);
>> +			(void)NEW_VARIANT_U(value);
>> 			GVariant* old_value =3D =
sensor_value_get_value(sensor);
>> 			bool do_set =3D false;
>> 			if(old_value =3D=3D NULL)
>> @@ -130,8 +131,6 @@ on_bus_acquired(GDBusConnection *connection,
>> {
>> 	ObjectSkeleton *object;
>>=20
>> -	cmdline *cmd =3D user_data;
>> -
>> 	manager =3D g_dbus_object_manager_server_new(dbus_object_path);
>> 	int i =3D 0;
>> 	for(i=3D0;i<NUM_HWMONS;i++)
>> diff --git a/objects/led_controller.c b/objects/led_controller.c
>> index 1f542e1..96e7ad1 100644
>> --- a/objects/led_controller.c
>> +++ b/objects/led_controller.c
>> @@ -5,6 +5,11 @@
>> #include <dirent.h>
>> #include <systemd/sd-bus.h>
>>=20
>> +static int led_stable_state_function(const char *, const char *);
>> +static int led_default_blink(const char *, const char *);
>> +static int read_led(const char *, const char *, void *, const =
size_t);
>> +static int led_custom_blink(const char *, sd_bus_message *);
>> +
>> /*
>>  * These are control files that are present for each led under
>>  *'/sys/class/leds/<led_name>/' which are used to trigger action
>> @@ -156,8 +161,8 @@ led_function_router(sd_bus_message *msg, void =
*user_data,
>>  * Turn On or Turn Off the LED
>>  * --------------------------------------------------------------
>>  */
>> -int
>> -led_stable_state_function(char *led_name, char *led_function)
>> +static int
>> +led_stable_state_function(const char *led_name, const char =
*led_function)
>> {
>> 	/* Generic error reporter. */
>> 	int rc =3D -1;
>> @@ -244,8 +249,8 @@ blink_led(const char *led_name, const char =
*on_duration, const char *off_duratio
>>  * Default blink action on the LED.
>>  * ----------------------------------------------------
>>  */
>> -int
>> -led_default_blink(char *led_name, char *blink_type)
>> +static int
>> +led_default_blink(const char *led_name, const char *blink_type)
>> {
>> 	/* Generic error reporter */
>> 	int rc =3D -1;
>> @@ -281,7 +286,7 @@ led_default_blink(char *led_name, char =
*blink_type)
>>  * Blinks at user defined 'on' and 'off' intervals.
>>  * -------------------------------------------------
>>  */
>> -int
>> +static int
>> led_custom_blink(const char *led_name, sd_bus_message *msg)
>> {
>> 	/* Generic error reporter. */
>> @@ -342,7 +347,7 @@ led_custom_blink(const char *led_name, =
sd_bus_message *msg)
>>  * size -or- entire contents of file whichever is smaller
>>  * ----------------------------------------------------------------
>>  */
>> -int
>> +static int
>> read_led(const char *name, const char *ctrl_file,
>> 		void *value, const size_t len)
>> {
>> diff --git a/objects/pcie_slot_present_obj.c =
b/objects/pcie_slot_present_obj.c
>> index a71ba2d..0c9258e 100644
>> --- a/objects/pcie_slot_present_obj.c
>> +++ b/objects/pcie_slot_present_obj.c
>> @@ -87,7 +87,6 @@ update_fru_obj(GDBusConnection* connection, =
object_info* obj_info, const char* p
>> 	GDBusProxy *proxy;
>> 	GError *error;
>> 	GVariant *parm;
>> -	GVariant *result;
>>=20
>> 	error =3D NULL;
>> 	proxy =3D g_dbus_proxy_new_sync(connection,
>> @@ -103,7 +102,7 @@ update_fru_obj(GDBusConnection* connection, =
object_info* obj_info, const char* p
>> 	error =3D NULL;
>> 	parm =3D g_variant_new("(s)",present);
>>=20
>> -	result =3D g_dbus_proxy_call_sync(proxy,
>> +	(void)g_dbus_proxy_call_sync(proxy,
>> 			"setPresent",
>> 			parm,
>> 			G_DBUS_CALL_FLAGS_NONE,
>> @@ -121,8 +120,6 @@ main(gint argc, gchar *argv[])
>> 	GDBusConnection *c;
>> 	GDBusProxy *sys_proxy;
>> 	GError *error;
>> -	GVariant *parm;
>> -	GVariant *result;
>>=20
>> 	loop =3D g_main_loop_new(NULL, FALSE);
>>=20
>> @@ -146,7 +143,6 @@ main(gint argc, gchar *argv[])
>> 	{
>> 		object_info obj_info;
>> 		uint8_t present;
>> -		char* chr_present;
>> 		do {
>> 			rc =3D =
get_object(sys_proxy,&slots[i],&obj_info);
>> 			if(rc) { break; }
>> diff --git a/objects/power_control_obj.c =
b/objects/power_control_obj.c
>> index 72947f5..da69413 100644
>> --- a/objects/power_control_obj.c
>> +++ b/objects/power_control_obj.c
>> @@ -36,8 +36,6 @@ poll_pgood(gpointer user_data)
>> 	Control* control =3D object_get_control((Object*)user_data);
>>=20
>> 	//send the heartbeat
>> -	const gchar* obj_path =3D =
g_dbus_object_get_object_path((GDBusObject*)user_data);
>> -
>> 	guint poll_int =3D control_get_poll_interval(control);
>> 	if(poll_int =3D=3D 0)
>> 	{
>> @@ -119,7 +117,6 @@ on_set_power_state(ControlPower *pwr,
>> 		gpointer user_data)
>> {
>> 	Control* control =3D object_get_control((Object*)user_data);
>> -	const gchar* obj_path =3D =
g_dbus_object_get_object_path((GDBusObject*)user_data);
>> 	if(state > 1)
>> 	{
>> 		g_dbus_method_invocation_return_dbus_error(invocation,
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
