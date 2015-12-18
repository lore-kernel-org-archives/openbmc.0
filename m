Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E5DB01A1A1B
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 15:07:38 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 17 Dec 2015 21:07:36 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 17 Dec 2015 21:07:35 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 768923E4003E
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 21:07:34 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBI47Y1025821416
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 21:07:34 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBI47YCH031675
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 21:07:34 -0700
Received: from birb.localdomain ([9.192.255.109])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBI47XpU031637; Thu, 17 Dec 2015 21:07:33 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 5E1662286E32; Fri, 18 Dec 2015 15:07:32 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2] Add get/set ipmid command support
 with correct DBUS property handling.
In-Reply-To: <1450407024-32509-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450407024-32509-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450407024-32509-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 18 Dec 2015 15:07:32 +1100
Message-ID: <87a8p85ri3.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121804-0025-0000-0000-00001FA98347
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
X-List-Received-Date: Fri, 18 Dec 2015 04:07:39 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> +struct set_sys_boot_options_t {
> +    uint8_t parameter;
> +    union {
> +        struct {
> +            uint8_t d1;
> +            uint8_t d2;
> +            uint8_t d3;
> +            uint8_t d4;
> +            uint8_t d5;
> +            uint8_t d6;
> +            uint8_t d7;
> +            uint8_t d8;
> +        } data8;
> +        uint64_t data64;
> +    } data;
> +}  __attribute__ ((packed));

How is this going to be used in an endian safe manner?

Why not use sparse annotations?

> +
>  ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
>                                ipmi_request_t request, ipmi_response_t response, 
>                                ipmi_data_len_t data_len, ipmi_context_t context)
> @@ -116,16 +332,41 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  
>      get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
>  
> -    // TODO Return default values to OPAL until dbus interface is available
> +    char* buf = (char*)malloc(NUM_RETURN_BYTES_OF_GET*2 + 1);
> +
> +    if (buf == NULL) {
> +        fprintf(stderr, "Malloc failed for get_sys_boot_options.\n");
> +        return IPMI_OUT_OF_SPACE;        

trailing whitespace

>      if (reqptr->parameter == 5) // Parameter #5

Why 5 ?

comment is redundantly redundant.

>      {
> -        uint8_t buf[] = {0x1,0x5,80,0,0,0,0};
> -        *data_len = sizeof(buf);
> -        memcpy(response, &buf, *data_len);
> +        int r = dbus_get_property(buf);
> +
> +        if (r < 0) {
> +            fprintf(stderr, "Dbus get property failed for get_sys_boot_options.\n");
> +            return IPMI_OUT_OF_SPACE;        
> +        }

trailing whitespace
