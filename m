Return-Path: <sam.mj@au1.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpstG09CwzDq5y
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:46:45 +1000 (AEST)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sam.mj@au1.ibm.com>;
 Tue, 19 Apr 2016 14:46:45 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 19 Apr 2016 14:46:42 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: sam.mj@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 22DA32CE8056
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:46:35 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3J4kR9p63635676
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:46:35 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3J4k2Kx027268
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:46:02 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3J4k1pA026744; Tue, 19 Apr 2016 14:46:02 +1000
Received: from localhost (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7D531A01E7;
 Tue, 19 Apr 2016 14:45:37 +1000 (AEST)
Date: Tue, 19 Apr 2016 14:45:37 +1000
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, ratagupt <ratagupt@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2 2/2] Review Comment added for 146621
Message-ID: <20160419044537.GA21932@localhost.localdomain>
References: <1460978439-16510-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460978439-16510-3-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1460978439-16510-3-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16041904-0025-0000-0000-000004538A5A
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
X-List-Received-Date: Tue, 19 Apr 2016 04:46:46 -0000

Hi Ratan,

When addressing comments it's best to squash your changes into the
original patch; please resend this as one patch.

Thanks!
Sam

On Mon, Apr 18, 2016 at 06:20:39AM -0500, OpenBMC Patches wrote:
> From: ratagupt <ratagupt@in.ibm.com>
> 
> ---
>  chassishandler.C | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/chassishandler.C b/chassishandler.C
> index 1a5508f..5144e15 100644
> --- a/chassishandler.C
> +++ b/chassishandler.C
> @@ -92,7 +92,7 @@ finish:
>      return r;
>  }
>  
> -int dbus_get_property(const char *name,char **buf)
> +int dbus_get_property(const char *name, char **buf)
>  {
>      sd_bus_error error = SD_BUS_ERROR_NULL;
>      sd_bus_message *m = NULL;
> @@ -161,7 +161,7 @@ finish:
>      return r;
>  }
>  
> -int dbus_set_property(const char * name,const char *value)
> +int dbus_set_property(const char * name, const char *value)
>  {
>      sd_bus_error error = SD_BUS_ERROR_NULL;
>      sd_bus_message *m = NULL;
> @@ -198,7 +198,7 @@ int dbus_set_property(const char * name,const char *value)
>                             host_intf_name,                             /* first argument */
>                             name,                                       /* second argument */
>                             "s",                                        /* third argument */
> -                           value);                                       /* fourth argument */
> +                           value);                                     /* fourth argument */
>  
>      if (r < 0) {
>          fprintf(stderr, "Failed to issue method call: %s\n", error.message);
> @@ -374,8 +374,9 @@ char* get_boot_option_by_ipmi(uint8_t p) {
>  }
>  
>  #define SET_PARM_VERSION 1
> -#define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80
> -#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0
> +#define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80 //boot flags data1 8th bit on
> +#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0 //boot flags data1 7&8 bit on 
> +#define SET_PARM_BOOT_FLAGS_ONETIME 0x40 //boot flags data1 7th bit on
>  
>  ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
>                                ipmi_request_t request, ipmi_response_t response, 
> @@ -433,7 +434,9 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>          } else {
>  
>              printf("BootPolicy is[%s]", p); 
> -            resp->data[0] = (strcmp(p,"ONETIME")==0)?SET_PARM_BOOT_FLAGS_VALID_ONE_TIME:SET_PARM_BOOT_FLAGS_VALID_PERMANENT;
> +            resp->data[0] = (strncmp(p,"ONETIME",strlen("ONETIME"))==0) ? 
> +                            SET_PARM_BOOT_FLAGS_VALID_ONE_TIME:
> +                            SET_PARM_BOOT_FLAGS_VALID_PERMANENT;
>              rc = IPMI_CC_OK;
>  
>          }
> @@ -489,7 +492,9 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>          }
>        
>          /* setting the boot policy */
> -        s= (char *)(((reqptr->data[0] & 0x40) == 0x40) ?"PERMANENT":"ONETIME");
> +        s = (char *)(((reqptr->data[0] & SET_PARM_BOOT_FLAGS_ONETIME) == 
> +                       SET_PARM_BOOT_FLAGS_ONETIME) ?"PERMANENT":"ONETIME");
> +
>          printf ( "\nBoot Policy is %s",s); 
>          int r = dbus_set_property("boot_policy",s);
>  
> -- 
> 2.7.1
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
