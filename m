Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1D20A1A00E9
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 16:51:16 +1100 (AEDT)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 6 Jan 2016 22:51:14 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 6 Jan 2016 22:51:12 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 63A253E4003B
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2016 22:51:12 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u075pCVD26673336
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2016 22:51:12 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u075pBB4005427
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2016 22:51:12 -0700
Received: from birb.localdomain ([9.81.192.176])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u075p2eq005071; Wed, 6 Jan 2016 22:51:10 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 49956229EAAE; Thu,  7 Jan 2016 16:50:59 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v5] Add get/set boot option ipmid
 command support with correct DBUS property handling.
In-Reply-To: <1452069029-12958-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452069029-12958-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452069029-12958-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 07 Jan 2016 16:50:59 +1100
Message-ID: <87r3huhr98.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16010705-8236-0000-0000-000014F0E35B
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
X-List-Received-Date: Thu, 07 Jan 2016 05:51:17 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: shgoupf <shgoupf@cn.ibm.com>
>
> 1) Add support for IPMI get/set boot option command.
>     a) boot options stored in dbus property.
>     b) IPMI get boot option command get boot option from the dbus
>     property.
>     c) IPMI set boot option coomand set boot option to the dbus
>     property.
> 2) Two methods to handle the dbus property set and get:
>     a) dbus_set_property()
>     b) dbus_get_property()
> 3) The property is stored as a 10 character strings which representsd 5-byte information.
> 4) ipmid set method is registered and implemented since petitboot will use it to clear the boot options.
> 5) Get service name via object mapper
>     a) The connection name is got via objectmapper.
>     b) The method used to get the connection name is object_mapper_get_connection().
>     c) dbus_get_property/dbus_set_property will get the connection name via the above method instead of hard coding.
> 6) Error code are properly handled.
> 7) Use sprinf/sscanf for int/string conversion.
>     a) Instead of reinventing the wheel by defining methods converting int to string, use sprintf/sscanf should be a more clean and robust way.
> 8) Fix issues addressed by the community.
>     a) change malloc heap to stack local variable.
>     b) Fix multi line comment style from "//" to "/**/".
>     c) Add defines for return codes.
>     d) Add more comments.

A commit message should describe the change/feature being implemented
and provide additional explanation, this reads like the story of how you
got to this point rather than describing what's going on.

> diff --git a/chassishandler.C b/chassishandler.C
> index 1389db9..8d516de 100644
> --- a/chassishandler.C
> +++ b/chassishandler.C
> @@ -5,9 +5,233 @@
<snip>
> -    if (reqptr->parameter == 5) // Parameter #5
> -    {
> -        uint8_t buf[] = {0x1,0x5,80,0,0,0,0};
> -        *data_len = sizeof(buf);
> -        memcpy(response, &buf, *data_len);
> +        if (r < 0) {
> +            fprintf(stderr, "Dbus get property failed for get_sys_boot_options.\n");
> +            return IPMI_OUT_OF_SPACE;
> +        }
> +
> +        uint64_t return_value;
> +        sscanf(buf, "%llX", &return_value);

should this be PRIx64 ?

> +
> +        *data_len = NUM_RETURN_BYTES_OF_GET;
> +        /*
> +         * TODO: last 3 bytes
> +         *(NUM_RETURN_BYTES_OF_GET - NUM_RETURN_BYTES_OF_GET_USED) is meanlingless
> +         */
> +        memcpy(response, (uint8_t *)(&return_value), *data_len);
> +    } else {
> +        *data_len = NUM_RETURN_BYTES_OF_GET;
> +        // Parameter not supported
> +        buf[0] = IPMI_CC_PARM_NOT_SUPPORTED;
> +        memcpy(response, buf, *data_len);
> +        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
> +        return IPMI_CC_PARM_NOT_SUPPORTED;
>      }
> -    else
> -    {
> +
> +    return rc;
> +}
> +
> +ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +        ipmi_request_t request, ipmi_response_t response,
> +        ipmi_data_len_t data_len, ipmi_context_t context)
> +{
> +    ipmi_ret_t rc = IPMI_CC_OK;
> +
> +    printf("IPMI SET_SYS_BOOT_OPTIONS\n");
> +    printf("IPMID set command required return bytes: %i\n",
> *data_len);

these look like debugging printouts? Is there any plan to move to
something better than printing to stdout?

> +
> +    set_sys_boot_options_t * reqptr = (set_sys_boot_options_t *) request;
> +
> +    char output_buf[NUM_RETURN_BYTES_OF_SET] = {0};
> +
> +    /*
> +     * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
> +     * This is the only parameter used by petitboot.
> +     */
> +    if (reqptr->parameter == 5) {
> +        /*
> +         * To represent a hex in string, e.g., "A0A0", which represents two bytes
> +         * in the hex, but requires 5 bytes to store it as string, i.e., 4
> +         * characters to store the "A0A0" and 1 additional space for "\0".
> +         * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
> +         */
> +        char input_buf[NUM_INPUT_BYTES_OF_SET * 2 + 1];
> +        sprintf(input_buf, "%llX", reqptr->data.data64);

snprintf is better as it can be more obviously correct, or rather, more
obvious to see that it's not an outright buffer overflow.

You also want to use C99 PRIx64 as otherwise this is incorrect on some
platforms and will emit a warning.

> +
> +        int r = dbus_set_property(input_buf);
> +
> +        if (r < 0) {
> +            fprintf(stderr, "Dbus set property failed for set_sys_boot_options.\n");
> +            return IPMI_OUT_OF_SPACE;
> +        }
> +
> +        *data_len = NUM_RETURN_BYTES_OF_SET;
> +        // Return code OK.
> +        output_buf[0] = IPMI_OK;
> +        memcpy(response, output_buf, *data_len);
> +    } else {
> +        // Parameter not supported
> +        output_buf[0] = IPMI_CC_PARM_NOT_SUPPORTED;
> +        memcpy(response, output_buf, *data_len);
>          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
> -        return IPMI_CC_PARM_NOT_SUPPORTED;        
> +        return IPMI_CC_PARM_NOT_SUPPORTED;

Keep whitespace fixes in a separate patch.

>      }
>  
>      return rc;
> @@ -135,12 +449,16 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  
>  void register_netfn_chassis_functions()
>  {
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_WILDCARD);
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS,
>  IPMI_CMD_WILDCARD);

same here, separate patch for pure whitespace fix.

>      ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_WILDCARD, NULL, ipmi_chassis_wildcard);
>  
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
>      ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
>  
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS);
> +    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options);
> +
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
>      ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL,
> NULL, ipmi_chassis_control);

and teh same for these.

>  }
> +
> diff --git a/chassishandler.h b/chassishandler.h
> index 1a26411..a310741 100644
> --- a/chassishandler.h
> +++ b/chassishandler.h
> @@ -3,21 +3,39 @@
>  
>  #include <stdint.h>
>  
> +// TODO: Petitboot requires 8 bytes of response
> +// however only 5 of them are used. The remaining
> +// 3 bytes are not used in petitboot and the value
> +// of them are all zero.

where? why? why will it never change?
-- 
Stewart Smith
OPAL Architect, IBM.
