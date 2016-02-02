Return-Path: <sam.mj@au1.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A85191A01D8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 14:44:12 +1100 (AEDT)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sam.mj@au1.ibm.com>;
 Tue, 2 Feb 2016 13:44:10 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 2 Feb 2016 13:44:08 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: sam.mj@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id D86862CE8056
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 14:44:07 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u123hxQQ53805096
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 14:44:07 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u123hZMb018514
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 14:43:35 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u123hZmC017213; Tue, 2 Feb 2016 14:43:35 +1100
Received: from localhost (unknown [9.192.205.201])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8B8A8A0061;
 Tue,  2 Feb 2016 14:42:40 +1100 (AEDT)
Date: Tue, 2 Feb 2016 14:42:39 +1100
From: Sam Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, William <bjlinan@cn.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v3] Add ipmi coldReset command, which
 call a dbus method,
 belongs to NETFUN_APP. 1. A method dbus_warm_reset() to
 talk with the dbus method 'warmRest'; 2. Also get service name by
 ipmid_get_sd_bus_connection() instead of object_mapper_get_connection(); 3.
 Register the ipmi command; 4. Add related .o to the Makefile; 5. Add
 wildcard function.
Message-ID: <20160202034239.GA2337@localhost.localdomain>
References: <1454308825-13334-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454308825-13334-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1454308825-13334-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16020203-0021-0000-0000-000002A4E792
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
X-List-Received-Date: Tue, 02 Feb 2016 03:44:12 -0000

Hi William, a question below;

On Mon, Feb 01, 2016 at 12:40:25AM -0600, OpenBMC Patches wrote:
> From: William <bjlinan@cn.ibm.com>
> 
> ---
>  Makefile        |   1 +
>  globalhandler.C | 171 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  globalhandler.h |  12 ++++
>  3 files changed, 184 insertions(+)
>  create mode 100644 globalhandler.C
>  create mode 100644 globalhandler.h
> 
> diff --git a/Makefile b/Makefile
> index 472bfaa..58e7310 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -15,6 +15,7 @@ LIB_APP_OBJ = apphandler.o     \
>                ipmisensor.o     \
>                storageaddsel.o  \
>                transporthandler.o  \
> +              globalhandler.o  
>  
>  LIB_HOST_SRV_OBJ = host-services.o
>  
> diff --git a/globalhandler.C b/globalhandler.C
> new file mode 100644
> index 0000000..e68ea79
> --- /dev/null
> +++ b/globalhandler.C
> @@ -0,0 +1,171 @@
> +#include "globalhandler.h"
> +#include "ipmid-api.h"
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +
> +const char  *control_object_name  =  "/org/openbmc/control/bmc0";
> +const char  *control_intf_name    =  "org.openbmc.control.Bmc";
> +
> +const char  *objectmapper_service_name =  "org.openbmc.objectmapper";
> +const char  *objectmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
> +const char  *objectmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
> +
> +void register_netfn_global_functions() __attribute__((constructor));
> +
> +int obj_mapper_get_connection(char** buf, const char* obj_path)
> +{
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    sd_bus_message *m = NULL;
> +    sd_bus *bus = NULL;
> +    char *temp_buf = NULL, *intf = NULL;
> +    size_t buf_size = 0;
> +    int r;
> +
> +    //Get the system bus where most system services are provided.
> +    bus = ipmid_get_sd_bus_connection();
> +
> +    /*
> +     * Bus, service, object path, interface and method are provided to call
> +     * the method.
> +     * Signatures and input arguments are provided by the arguments at the
> +     * end.
> +     */
> +    r = sd_bus_call_method(bus,
> +            objectmapper_service_name,                      /* service to contact */
> +            objectmapper_object_name,                       /* object path */
> +            objectmapper_intf_name,                         /* interface name */
> +            "GetObject",                                    /* method name */
> +            &error,                                         /* object to return error in */
> +            &m,                                             /* return message on success */
> +            "s",                                            /* input signature */
> +            obj_path                                        /* first argument */
> +            );
> +
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
> +        goto finish;
> +    }
> +
> +    // Get the key, aka, the connection name
> +    sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
> +    
> +	/* 
> +     * TODO: check the return code. Currently for no reason the message
> +     * parsing of object mapper is always complaining about
> +     * "Device or resource busy", but the result seems OK for now. Need
> +     *  further checks.
> +     */

I've seen this comment before and it worries me a bit. Why are we
getting the error? How do you know temp_buf is allocated properly? What
does it mean that the result "seems OK"?
You check return codes before and after this, but if you get unlucky
here you could easily segfault or read nonsense.

I think this issue should be figured out before merging the code, both
here and wherever else it appears.

Thanks,
Sam

> +
> +    buf_size = strlen(temp_buf) + 1;
> +    printf("IPMID connection name: %s\n", temp_buf);
> +    *buf = (char*)malloc(buf_size);
> +
> +    if (*buf == NULL) {
> +        fprintf(stderr, "Malloc failed for warm reset");
> +        r = -1;
> +        goto finish;
> +    }
> +
> +    memcpy(*buf, temp_buf, buf_size);
> +
> +finish:
> +    sd_bus_error_free(&error);
> +    sd_bus_message_unref(m);
> +
> +    return r;
> +}
> +
> +int dbus_warm_reset()
> +{
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    sd_bus_message *m = NULL;
> +    sd_bus *bus = NULL;
> +    char* temp_buf = NULL;
> +    uint8_t* get_value = NULL;
> +    char* connection = NULL;
> +    int r, i;
> +
> +    r = obj_mapper_get_connection(&connection, control_object_name);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to get connection, return value: %d.\n", r);
> +        goto finish;
> +    }
> +
> +    printf("connection: %s\n", connection);
> +
> +    // Open the system bus where most system services are provided.
> +    bus = ipmid_get_sd_bus_connection();
> +    
> +    /*
> +     * Bus, service, object path, interface and method are provided to call
> +     * the method.
> +     * Signatures and input arguments are provided by the arguments at the
> +     * end.
> +	 */
> +    r = sd_bus_call_method(bus,
> +            connection,                                /* service to contact */
> +            control_object_name,                       /* object path */
> +            control_intf_name,                         /* interface name */
> +            "warmReset",                               /* method name */
> +            &error,                                    /* object to return error in */
> +            &m,                                        /* return message on success */
> +            NULL,
> +            NULL
> +            );
> +
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
> +        goto finish;
> +    }
> +
> +finish:
> +    sd_bus_error_free(&error);
> +    sd_bus_message_unref(m);
> +    free(connection);
> +
> +    return r;
> +}
> +
> +ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t response,
> +                              ipmi_data_len_t data_len, ipmi_context_t context)
> +{
> +    printf("Handling GLOBAL warmReset Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
> +
> +    // TODO: call the correct dbus method for warmReset.
> +    dbus_warm_reset();
> +
> +    // Status code.
> +    ipmi_ret_t rc = IPMI_CC_OK;
> +    *data_len = 0;
> +    return rc;
> +}
> +
> +ipmi_ret_t ipmi_global_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t response,
> +                              ipmi_data_len_t data_len, ipmi_context_t context)
> +{
> +    printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
> +
> +    // Status code.
> +    ipmi_ret_t rc = IPMI_CC_OK;
> +
> +    *data_len = strlen("THIS IS WILDCARD");
> +
> +    // Now pack actual response
> +    memcpy(response, "THIS IS WILDCARD", *data_len);
> +
> +    return rc;
> +}
> +
> +void register_netfn_global_functions()
> +{
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WARM_RESET);
> +    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WARM_RESET, NULL, ipmi_global_warm_reset);
> +
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
> +    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_global_wildcard_handler);
> +
> +	return;
> +}
> diff --git a/globalhandler.h b/globalhandler.h
> new file mode 100644
> index 0000000..608df3b
> --- /dev/null
> +++ b/globalhandler.h
> @@ -0,0 +1,12 @@
> +#ifndef __HOST_IPMI_GLOBAL_HANDLER_H__
> +#define __HOST_IPMI_GLOBAL_HANDLER_H__
> +
> +#include <stdint.h>
> +
> +// Various GLOBAL operations under a single command.
> +enum ipmi_global_control_cmds : uint8_t
> +{
> +IPMI_CMD_WARM_RESET 			   = 0x02,
> +};
> +
> +#endif
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
