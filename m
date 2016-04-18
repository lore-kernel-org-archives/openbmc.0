Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpMJN5yd4zDq5f
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 18:49:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Sw7oLMNz; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id vv3so15676947pab.0
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dVLqwdQm6Fd0BCuPj5RPrnrmSeKdMJoNZF3ByjHdSs=;
 b=Sw7oLMNzSM71izHtcNZDlFE7AMFiI571SRPpC+GwjfcTKUPfb5gL4g6Ug6LKcZ9PGX
 swOfIviR8Gnhy4K/ewts2KSMczmpVbX7Y735PiKFbYdo50ZoZg72sDCaEm8yBUA149TB
 /wVJCNcVyQc9X9o0OXLS/bH77oRcPfhXu4yw1WHQoHQQszCHOvQEq21muhz8x8QkKwwD
 NJB0uztvbeXbmvW0+ujtVB9C3SGPyvFDQerYctLC2WwgAGto0WYYuNOPTLAXaDPLGVQF
 IvhpOVhUQIKxMHCWEF+PNbumRNuMfYpEhrMbnGvJlTRney21vQYNN2f81R6jne7olbAk
 vw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dVLqwdQm6Fd0BCuPj5RPrnrmSeKdMJoNZF3ByjHdSs=;
 b=KTsyCYo+Eezp/VlVZXss5vqvoFLs+LqjA4OTnujoUeXHLkW6jy+B3o2HDSCrdk6C3a
 858TzZcTfhfPu7k77nOtVK24VE6UxgMdkpjg2hcNEjmuOih62F7m/HTMyTHvkhOmT+gP
 l1HRvMxyBTLKpN+hxvwkt4Suj9vBaa7FCNyqZWZ9u94U+iyt7e9qdD/fzEI/axVk5zeh
 PLfYoDrHohQnM+a0cHTL4HsWIMNBU2Al7WR6jPo9ippaq9W/PkFpA36wnQ/Xlw+VMlJ3
 6oThB7dttsvC/LjrUyZIIFkQJ3CBTBFhkdlB+uUu21Zv1qonkXxTfDTg2KWFEOxJe4sv
 Dt2g==
X-Gm-Message-State: AOPr4FXidRUJ7oB0zLoggj4QRXne9oz5WMTAP+3dsXmtwZwqkcOrLlyLZn0HLhNfef7diQ==
X-Received: by 10.66.193.202 with SMTP id hq10mr46982057pac.6.1460969345420;
 Mon, 18 Apr 2016 01:49:05 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id yp9sm28273431pab.42.2016.04.18.01.49.02
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 18 Apr 2016 01:49:05 -0700 (PDT)
Date: Mon, 18 Apr 2016 18:48:55 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: "Ratan K Gupta" <ratagupt@in.ibm.com>
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Adding Boot Policy
Message-ID: <20160418184855.0eb3ddc4@camb691>
In-Reply-To: <201604180839.u3I8d2r333685516@d28relay01.in.ibm.com>
References: <20160405113150.70c2ffe5@camb691>
 <1459769436-22641-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459769436-22641-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201604180839.u3I8d2r333685516@d28relay01.in.ibm.com>
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
X-List-Received-Date: Mon, 18 Apr 2016 08:49:09 -0000

On Mon, 18 Apr 2016 08:38:58 +0000
"Ratan K Gupta" <ratagupt@in.ibm.com> wrote:

> Hi Cyril,
>  
> Please find my comments inline.
>  
> Regards
> Ratan
> ----- Original message -----
> From: Cyril Bur <cyrilbur@gmail.com>
> To: Ratan K Gupta/India/IBM@IBMIN
> Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
> Subject: Re: [PATCH phosphor-host-ipmid] Adding Boot Policy
> Date: Tue, Apr 5, 2016 7:03 AM
>  
> On Mon,  4 Apr 2016 06:30:36 -0500
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
> 
> Hi,
> 
> Thanks for the contribution. I have some concerns, most are summarised here:
> https://github.com/openbmc/docs/blob/master/contributing.md
> 
> You'll want to note
> https://github.com/openbmc/docs/blob/master/contributing.md#coding-style and
> https://github.com/openbmc/docs/blob/master/contributing.md#submitting-changes
> 
> I've added further comments inline.
> 
> Thanks,
> 
> Cyril
> 
> > From: ratagupt <ratagupt@in.ibm.com>
> >
> > ---
> >  chassishandler.C | 59 ++++++++++++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 47 insertions(+), 12 deletions(-)
> >
> > diff --git a/chassishandler.C b/chassishandler.C
> > index fca3c79..1a5508f 100644
> > --- a/chassishandler.C
> > +++ b/chassishandler.C
> > @@ -92,7 +92,7 @@ finish:
> >      return r;
> >  }
> >  
> > -int dbus_get_property(char **buf)
> > +int dbus_get_property(const char *name,char **buf)
> 
> The style guide recommends spaces between parameters.
>  
> >>>>RG:- Done
> 
> >  {
> >      sd_bus_error error = SD_BUS_ERROR_NULL;
> >      sd_bus_message *m = NULL;
> > @@ -128,7 +128,7 @@ int dbus_get_property(char **buf)
> >                             &m,                                         /* return message on success */
> >                             "ss",                                       /* input signature */
> >                             host_intf_name,                             /* first argument */
> > -                           "boot_flags");                              /* second argument */
> > +                           name);                                      /* second argument */
> >  
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to issue method call: %s\n", error.message);
> > @@ -161,7 +161,7 @@ finish:
> >      return r;
> >  }
> >  
> > -int dbus_set_property(const char *buf)
> > +int dbus_set_property(const char * name,const char *value)
> >  {
> >      sd_bus_error error = SD_BUS_ERROR_NULL;
> >      sd_bus_message *m = NULL;
> > @@ -196,16 +196,16 @@ int dbus_set_property(const char *buf)
> >                             &m,                                         /* return message on success */
> >                             "ssv",                                      /* input signature */
> >                             host_intf_name,                             /* first argument */
> > -                           "boot_flags",                               /* second argument */
> > +                           name,                                       /* second argument */
> >                             "s",                                        /* third argument */
> > -                           buf);                                       /* fourth argument */
> > +                           value);                                       /* fourth argument */
> 
> I'm not really sure why the /* {nth} argument */ comments but since they're
> there please try to keep them aligned...
> >>>>RG:Done
> >  
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to issue method call: %s\n", error.message);
> >          goto finish;
> >      }
> >  
> > -    printf("IPMID boot option property set: {%s}.\n", buf);
> > +    printf("IPMID boot option property set: {%s}.\n", value);
> >  
> >  finish:
> >      sd_bus_error_free(&error);
> > @@ -374,7 +374,8 @@ char* get_boot_option_by_ipmi(uint8_t p) {
> >  }
> >  
> >  #define SET_PARM_VERSION 1
> > -#define SET_PARM_BOOT_FLAGS_VALID   0x80
> > +#define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80
> > +#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0
> >  
> >  ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >                                ipmi_request_t request, ipmi_response_t response,
> > @@ -391,7 +392,7 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >      memset(resp,0,sizeof(*resp));
> >      resp->version   = SET_PARM_VERSION;
> >      resp->parm      = 5;
> > -    resp->data[0]   = SET_PARM_BOOT_FLAGS_VALID;
> > +    resp->data[0]   = SET_PARM_BOOT_FLAGS_VALID_ONE_TIME;
> >  
> >      *data_len = sizeof(*resp);
> >  
> > @@ -401,10 +402,11 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >       */
> >      if (reqptr->parameter == 5) {
> >  
> > -        int r = dbus_get_property(&p);
> > +        /* Get the boot device */
> > +        int r = dbus_get_property("boot_flags",&p);
> >  
> >          if (r < 0) {
> > -            fprintf(stderr, "Dbus get property failed for get_sys_boot_options.\n");
> > +            fprintf(stderr, "Dbus get property(boot_flags) failed for get_sys_boot_options.\n");
> >              rc = IPMI_CC_UNSPECIFIED_ERROR;
> >  
> >          } else {
> > @@ -412,8 +414,31 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >              s = get_ipmi_boot_option(p);
> >              resp->data[1] = (s << 2);
> >              rc = IPMI_CC_OK;
> > +
> > +        }
> > +
> > +        if (p)
> > +        {
> > +          free(p);
> > +          p = NULL;
> > +        }
> 
> Just fyi free() will happily accept NULL as an argument and simply do nothing.
> >>>>RG:- I was following the approach which was there before.
> > +
> > +        /* Get the boot policy */
> > +        r = dbus_get_property("boot_policy",&p);
> > +
> > +        if (r < 0) {
> > +            fprintf(stderr, "Dbus get property(boot_policy) failed for get_sys_boot_options.\n");
> > +            rc = IPMI_CC_UNSPECIFIED_ERROR;
> > +
> > +        } else {
> > +
> > +            printf("BootPolicy is[%s]", p);
> > +            resp->data[0] = (strcmp(p,"ONETIME")==0)?SET_PARM_BOOT_FLAGS_VALID_ONE_TIME:SET_PARM_BOOT_FLAGS_VALID_PERMANENT;
> 
> Wow, could you please make use of the spacebar and perhaps the enter key?
> RG:>>>>>>Done
> 
> Also, just to be safe it would be best of use strncmp.
> For example strncmp(p, "ONETIME", strlen("ONETIME"))
> 
> > +            rc = IPMI_CC_OK;
> > +
> >          }
> >  
> > +
> >      } else {
> >          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
> >      }
> > @@ -455,13 +480,23 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >  
> >          } else {
> >  
> > -            int r = dbus_set_property(s);
> > +            int r = dbus_set_property("boot_flags",s);
> >  
> >              if (r < 0) {
> > -                fprintf(stderr, "Dbus set property failed for set_sys_boot_options.\n");
> > +                fprintf(stderr, "Dbus set property(boot_flags) failed for set_sys_boot_options.\n");
> >                  rc = IPMI_CC_UNSPECIFIED_ERROR;
> >              }
> >          }
> > +      
> > +        /* setting the boot policy */
> > +        s= (char *)(((reqptr->data[0] & 0x40) == 0x40) ?"PERMANENT":"ONETIME");
> 
> Firstly if you declare s as a 'const char *' (which by the looks of things it
> probably should be anyway...) then you won't need the cast. Why introduce 0x40?
> Wouldn't it be cleaner to just do
> 
> if ((reqptr->data[0] & SET_PARM_BOOT_FLAGS_VALID_PERMANENT) ==
>                       SET_PARM_BOOT_FLAGS_VALID_PERMANENT)
> s = "PERMANENT";
> else
> s = "ONETIME";
> >>>>>>>RG: would not be able to check with SET_PARM_BOOT_FLAGS_VALID_PERMANENT as by doing this it checks for the two bits(6 and 7).But with the 0x40,We are only checking the one bit(6th bit).

Yes I understand that, which is why I added the 
'== SET_PARM_BOOT_FLAGS_VALID_PERMANENT' so that the condition is only true if
both bits 6 and 7 are set.

For example: If only bit 7 is set then (reqptr->data[0] &
SET_PARM_BOOT_FLAGS_VALID_PERMANENT) will not ==
SET_PARM_BOOT_FLAGS_VALID_PERMANENT

> Anyways I have created the macro for better readability.
> 
> > +        printf ( "\nBoot Policy is %s",s);
> > +        int r = dbus_set_property("boot_policy",s);
> > +
> > +        if (r < 0) {
> > +            fprintf(stderr, "Dbus set property(boot_policy) failed for set_sys_boot_options.\n");
> > +            rc = IPMI_CC_UNSPECIFIED_ERROR;
> > +            }
> >  
> >      } else {
> >          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
>  
> 
> 
