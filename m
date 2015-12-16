Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A20261A06C9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 08:45:56 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 16 Dec 2015 16:45:53 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 Dec 2015 16:45:26 -0500
X-IBM-Helo: b01cxnp23034.gho.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBGLj0Y913566134
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 21:45:00 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBGLixG6007360
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 16:45:00 -0500
Received: from birb.localdomain ([9.192.255.109])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBGLiw3F007321; Wed, 16 Dec 2015 16:44:59 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 961912286E41; Thu, 17 Dec 2015 08:44:55 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v3 2/6] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <1450270225-2497-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450270225-2497-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450270225-2497-3-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 17 Dec 2015 08:44:55 +1100
Message-ID: <87twni5aqw.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
x-cbid: 15121621-0057-0000-0000-000002E232FA
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
X-List-Received-Date: Wed, 16 Dec 2015 21:45:57 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: shgoupf <shgoupf@cn.ibm.com>
>
> 1) Two methods to handle the dbus property set and get:
>     a) dbus_set_property()
>     b) dbus_get_property()
> 2) The property is stored as a 10 character strings which represents
> 5-byte information.
> 3) ipmid set method is registered and implemented since petitboot will
> use it to clear the boot options.
> ---
>  apphandler.C       |  70 ++----------
>  apphandler.h       |  33 +-----
>  chassishandler.C   | 306 ++++++++++++++++++++++++++++++++++++++---------------
>  chassishandler.h   |  20 ++--
>  ipmid-api.h        |  13 +--
>  ipmid.C            |  26 ++---
>  ipmisensor.C       |  35 +-----
>  sensorhandler.C    |  17 ++-
>  storageaddsel.C    |  42 ++++++--
>  storagehandler.C   |  20 +---
>  transporthandler.C |   2 +
>  11 files changed, 304 insertions(+), 280 deletions(-)
>
> diff --git a/apphandler.C b/apphandler.C
> index 2c9ce6b..6467397 100644
> --- a/apphandler.C
> +++ b/apphandler.C
> @@ -10,76 +10,20 @@ extern sd_bus *bus;
>  
>  void register_netfn_app_functions() __attribute__((constructor));
>  
> -//---------------------------------------------------------------------
> -// Called by Host on seeing a SMS_ATN bit set. Return a hardcoded 
> -// value of 0x2 indicating we need Host read some data.
> -//-------------------------------------------------------------------
> -ipmi_ret_t ipmi_app_get_msg_flags(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> -                             ipmi_request_t request, ipmi_response_t response,
> -                             ipmi_data_len_t data_len, ipmi_context_t
> context)

It is unclear why this is being removed. Is it replaced by something else?

> -//-------------------------------------------------------------------
> -// Called by Host post response from Get_Message_Flags
> -//-------------------------------------------------------------------
>  ipmi_ret_t ipmi_app_read_event(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>                               ipmi_request_t request, ipmi_response_t response,
>                               ipmi_data_len_t data_len, ipmi_context_t context)
>  {
>      ipmi_ret_t rc = IPMI_CC_OK;
> -    printf("IPMI APP READ EVENT command received\n");
> -
> -	// TODO : For now, this is catering only to the Soft Power Off via OEM SEL
> -	//        mechanism. If we need to make this generically used for some
> -	//        other conditions, then we can take advantage of context pointer.
> -
> -	struct oem_sel_timestamped soft_off = {0};
> -    *data_len = sizeof(struct oem_sel_timestamped);
> -
> -	// either id[0] -or- id[1] can be filled in. We will use id[0]
> -	soft_off.id[0]	 = SEL_OEM_ID_0;
> -	soft_off.id[1]	 = SEL_OEM_ID_0;
> -	soft_off.type	 = SEL_RECORD_TYPE_OEM;
> -
> -	// Following 3 bytes are from IANA Manufactre_Id field. See below
> -	soft_off.manuf_id[0]= 0x41;
> -	soft_off.manuf_id[1]= 0xA7;
> -	soft_off.manuf_id[2]= 0x00;
> -
> -	// per IPMI spec NetFuntion for OEM
> -	soft_off.netfun	 = 0x3A;
> -
> -	// Mechanism to kick start soft shutdown.
> -	soft_off.cmd	 = CMD_POWER;
> -	soft_off.data[0] = SOFT_OFF;
> -
> -	// All '0xFF' since unused.
> -	memset(&soft_off.data[1], 0xFF, 3);
> +    *data_len = 0;
>  
> -    // Pack the actual response
> -    memcpy(response, &soft_off, *data_len);
> +    printf("IPMI APP READ EVENT Ignoring for now\n");
>      return rc;
> +
>  }

Feels like should be a separate patch, I'm unsure as to how this is
related to adding get/set methods.


> diff --git a/apphandler.h b/apphandler.h
> index aa2a55d..35a2b20 100644
> --- a/apphandler.h
> +++ b/apphandler.h
> @@ -1,19 +1,6 @@
>  #ifndef __HOST_IPMI_APP_HANDLER_H__
>  #define __HOST_IPMI_APP_HANDLER_H__
>  
> -#include <stdint.h>
> -
> -// These are per skiboot ipmi-sel code
> -
> -// OEM_SEL type with Timestamp
> -#define SEL_OEM_ID_0		0x55
> -// SEL type is OEM and -not- general SEL
> -#define SEL_RECORD_TYPE_OEM	0xC0
> -// Minor command for soft shurdown
> -#define SOFT_OFF			0x00
> -// Major command for Any kind of power ops
> -#define CMD_POWER			0x04
> -

not sure how the removal of these is related to this patch. Should be a
separate one?

>  // IPMI commands for App net functions.
>  enum ipmi_netfn_app_cmds
>  {
> @@ -24,27 +11,9 @@ enum ipmi_netfn_app_cmds
>      IPMI_CMD_RESET_WD               = 0x22,
>      IPMI_CMD_SET_WD                 = 0x24,
>      IPMI_CMD_SET_BMC_GLOBAL_ENABLES = 0x2E,
> -    IPMI_CMD_GET_MSG_FLAGS          = 0x31,
>      IPMI_CMD_READ_EVENT             = 0x35,
>      IPMI_CMD_GET_CAP_BIT            = 0x36,
> -};

same here.


>  
> -// A Mechanism to tell host to shtudown hosts by sending this PEM SEL. Really
> -// the only used fields by skiboot are:
> -// id[0] / id[1] for ID_0 , ID_1
> -// type : SEL_RECORD_TYPE_OEM as standard SELs are ignored by skiboot
> -// cmd : CMD_POWER for power functions
> -// data[0], specific commands.  example Soft power off. power cycle, etc.
> -struct oem_sel_timestamped
> -{
> -	/* SEL header */
> -	uint8_t id[2];
> -	uint8_t type;
> -	uint8_t manuf_id[3];
> -	uint8_t timestamp[4];
> -	/* OEM SEL data (6 bytes) follows */
> -	uint8_t netfun;
> -	uint8_t cmd;
> -	uint8_t data[4];
>  };
> +
>  #endif

and here.

> diff --git a/chassishandler.C b/chassishandler.C
> index 1389db9..7694bd5 100644
> --- a/chassishandler.C
> +++ b/chassishandler.C
> @@ -4,10 +4,147 @@
>  #include <string.h>
>  #include <stdint.h>
>  
> -// OpenBMC Chassis Manager dbus framework
> -const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
> -const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
> -const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
> +char* uint8_to_char(uint8_t *a, size_t size)
> +{
> +    char* buffer;
> +    int i;
> +
> +    buffer = (char*)malloc(size * 2 + 1);
> +    if (!buffer)
> +        return NULL;
> +
> +    buffer[size * 2] = 0;
> +    for (i = 0; i < size; i++) {
> +        uint8_t msb = (a[i] >> 4) & 0xF;
> +        uint8_t lsb = a[i] & 0xF;
> +        buffer[2*i] = msb > 9 ? msb + 'A' - 10 : msb + '0';
> +        buffer[2*i + 1] = lsb > 9 ? lsb + 'A' - 10 : lsb + '0';
> +    }
> +
> +    return buffer;
> +}
> +
> +uint8_t* char_to_uint8(char *a, size_t size)
> +{
> +    uint8_t* buffer;
> +    int i;
> +
> +    buffer = (uint8_t*)malloc(size);
> +    if (!buffer)
> +        return NULL;
> +
> +    for (i = 0; i < size; i++) {
> +        uint8_t msb = (uint8_t)(a[2*i] > '9' ? a[2*i] - 'A' + 10 : a[2*i] - '0');
> +        uint8_t lsb = (uint8_t)(a[2*i+1] > '9' ? a[2*i+1] - 'A' + 10 : a[2*i+1] - '0');
> +        buffer[i] = ((msb << 4) | (lsb & 0xF)) & 0xFF;
> +    }
> +
> +    return buffer;
> +}

What do these functions *do*? The names of uint8_to_char and
char_to_uint8 make absolutely zero sense to me as a char is, in fact, 8
bits, i.e. a uint8_t, just with a different semantic meaning.

Is there some weird IPMI specific format of strings?

> -//----------------------------------------------------------------------
> -// Chassis Control commands
> -//----------------------------------------------------------------------
> -ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
> -                        ipmi_request_t request, ipmi_response_t response, 
> -                        ipmi_data_len_t data_len, ipmi_context_t context)
> -{
> -	// Error from power off.
> -	int rc = 0;
> +    char* buf = (char*)malloc(NUM_RETURN_BYTES_OF_GET);
>  
> -	// No response for this command.
> -    *data_len = 0;
> +    if (reqptr->parameter == 5) // Parameter #5
> +    {
> +        dbus_get_property(buf);
> +        uint8_t* return_value = char_to_uint8(buf, NUM_RETURN_BYTES_OF_GET_USED);
> +        *data_len = NUM_RETURN_BYTES_OF_GET;
> +        // TODO: last 3 bytes
> +        // (NUM_RETURN_BYTES_OF_GET - NUM_RETURN_BYTES_OF_GET_USED) is meanlingless
> +        memcpy(response, return_value, *data_len);
> +        free(buf);
> +        free(return_value);

This isn't safe if dbus_get_property fails (which it can). Indeed, if it
does, you'll be running a whole bunch of code on unitialised data. If
you're lucky you'll segv, if unlucky, exploitable security hole.

> -ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
> +ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
>                                ipmi_request_t request, ipmi_response_t response, 
>                                ipmi_data_len_t data_len, ipmi_context_t context)
>  {
>      ipmi_ret_t rc = IPMI_CC_OK;
> -    *data_len = 0;
>  
> -    printf("IPMI GET_SYS_BOOT_OPTIONS\n");
> +    printf("IPMI SET_SYS_BOOT_OPTIONS\n");
> +    printf("IPMID set command required return bytes: %i\n", *data_len);
>  
> -    get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
> +    set_sys_boot_options_t *reqptr = (set_sys_boot_options_t*) request;
>  
> -    // TODO Return default values to OPAL until dbus interface is available
> +    char* output_buf = (char*)malloc(NUM_RETURN_BYTES_OF_SET);

This pattern repeats itself a lot - not checking for return value of
malloc.

Since OpenBMC is going to be running in a relatively constrained
resource environment, likely without swap and there's probably a good
argument for turning memory overcommit off, you probably want to fail
somewhat gracefully - or at the very least assert() and fail in a known
way rather than continue ond dereference null pointers.

> @@ -141,6 +257,28 @@ void register_netfn_chassis_functions()
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
>      ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
>  
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
> -    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS);
> +    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options);
> +
> +    // TODO: Testing for dbus property set/get and related methods.
> +    printf("----> Start of chassis handler testing.\n");
> +    set_sys_boot_options_t req = {0x80, 0x10, 0xA2, 0x3B, 0x45, 0x57}; 
> +    char* set_value = uint8_to_char((uint8_t*)(&(req.data1)), 5);
> +    dbus_set_property(set_value);
> +    char* buf = (char*)malloc(NUM_RETURN_BYTES_OF_GET_USED * 2 + 1);

again, not checking results of dbus_set_property or malloc.

> +    dbus_get_property(buf);
> +    uint8_t* get_value = char_to_uint8(buf, NUM_RETURN_BYTES_OF_GET_USED);
> +    int i;
> +    printf("buf: %s\n", (char*)buf);
> +    printf("0x");
> +    for (i = 0; i < 5; i++) {
> +        printf("%2x", get_value[i]);
> +    }
> +    printf("\n");
> +    printf("----> End of chassis handler testing.\n");
> +    free(buf);
> +    free(set_value);
> +    free(get_value);
>  }
> +
> +
> diff --git a/chassishandler.h b/chassishandler.h
> index 1a26411..80e40a8 100644
> --- a/chassishandler.h
> +++ b/chassishandler.h
> @@ -1,14 +1,18 @@
>  #ifndef __HOST_IPMI_CHASSIS_HANDLER_H__
>  #define __HOST_IPMI_CHASSIS_HANDLER_H__
>  
> -#include <stdint.h>
> +// TODO: Petitboot requires 8 bytes of response
> +// however only 5 of them are used.

Is this due to petitboto behaviour quirk or something that's
standardized somewhere?

what should the unused bytes be set to? 0x00? 0xFF?
