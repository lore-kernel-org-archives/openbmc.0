Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C0A5F1A0191
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 12:10:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Xr9Btwba; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id y7so446982paa.2
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2016 17:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=Q0DDLXd7g6kmohOJYnEJLOGCP6stUfhn6+m5txJMILA=;
 b=Xr9BtwbaU+lY/vcM09cEjGdyfVuF8ZUtWwXaQe0KRABUp3YorBoXkoenalobQXqSOj
 tqjgA2KDb0j/TV9FD2H3U5IqRrTDjbaO/8cauyjrDs/ipt1/cd+AnSrWtvuX5F68OA8+
 e5sN7NJb931BuEfCqu1mpTa58wxzwPdAO/cfmw0DKuZTqG+JUQaXnUGzj9ZgziUMiTyV
 njWpNG8WzL5Zv7KKbQfWqJy9gCOWpgEJdf7fYrTB/khSzOPXBRZvxtw6FRcrLAySTDV1
 l8buWqyEYRR0O/Ar+Ud89qSngxOYqSaebyvPe2maUlyfQ994+UIqGXlwqwwL7012el/y
 Ozkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=Q0DDLXd7g6kmohOJYnEJLOGCP6stUfhn6+m5txJMILA=;
 b=DXkPa+y1zstie+Xb1daw0cceDfqU0jM1Eg80X+vAfKY0f10fZjNuAla5d56dNeuKka
 vc9RSHBqdpBxB+Jo4dzKDoaDmT6UB8EKxTmG5B5UIzCLpRkWfa92XWQR/SZPC9Z8yrNT
 K/eRjWMFW0g/ZVOLBRLgj/rNFfC4zpYPXEkc16nOL44PrTHLRLqx00YYs2EGrQubPjTl
 KwmWRLDUgBZMf8x1LJN/tZwM5e51ou90c6U5lBB2WLZQIfNYOEx4xo1smVZiBqy0+GC/
 Tkn7fM1/6jW5iOl5NT9Pr21SN7zpLKO+lJdayXmFWkmkYtBj7kiisM+54aTMU3rxO16X
 M/6A==
X-Gm-Message-State: AG10YOQn+TeUd8/DPq/VhCxJrRXXHsW77tJs8L+4iXm6sHi+CwIeEn+ZMZdef705SQVWPQ==
X-Received: by 10.66.139.134 with SMTP id qy6mr46368577pab.45.1454980238583;
 Mon, 08 Feb 2016 17:10:38 -0800 (PST)
Received: from camb691 (pa49-195-135-159.pa.nsw.optusnet.com.au.
 [49.195.135.159])
 by smtp.gmail.com with ESMTPSA id d8sm46117990pas.14.2016.02.08.17.10.36
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 08 Feb 2016 17:10:38 -0800 (PST)
Date: Tue, 9 Feb 2016 12:10:39 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: anoo@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Get MAC address
Message-ID: <20160209121039.6bf93d91@camb691>
In-Reply-To: <1454974827-10588-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454974827-10588-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454974827-10588-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Tue, 09 Feb 2016 01:10:41 -0000

On Mon,  8 Feb 2016 17:40:27 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Adriana Kobylak <anoo@us.ibm.com>
> 
> Support for Get MAC address command.
> Address review comments from Set MAC command.

Hi Adriana, thanks for doing the cleanup.

It looks like you've done a few things in the same patch.

Could you please separate out the response to Joel and Daniels review from your
new work?

Comments below,

Cyril
> ---
>  transporthandler.C | 100 ++++++++++++++++++++++++++++++-----------------------
>  transporthandler.h |   9 +++++
>  2 files changed, 66 insertions(+), 43 deletions(-)
> 
> diff --git a/transporthandler.C b/transporthandler.C
> index c38adea..0ef818d 100644
> --- a/transporthandler.C
> +++ b/transporthandler.C

I think Joel mentioned something about not declaring sd_bus as extern?

> @@ -52,6 +52,10 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  {
>      ipmi_ret_t rc = IPMI_CC_OK;
>      *data_len = 0;
> +    sd_bus_message *reply = NULL, *m = NULL;
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    int r = 0;
> +
>  
>      printf("IPMI SET_LAN\n");
>  
> @@ -61,18 +65,15 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      // TODO Add the rest of the parameters like setting auth type
>      // TODO Add error handling
>  
> -    if (reqptr->parameter == 3) // IP
> +    if (reqptr->parameter == LAN_PARM_IP)
>      {
>          sprintf(new_ipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
>      }
> -    else if (reqptr->parameter == 5) // MAC
> +    else if (reqptr->parameter == LAN_PARM_MAC)
>      {
>          char                mac[18];
> -        sd_bus_message *reply = NULL, *m = NULL;
> -        sd_bus_error error = SD_BUS_ERROR_NULL;
> -        int r = 0;
>  

I'm pretty sure that isn't what Joel meant in his review

> -        sprintf(mac, "%x:%x:%x:%x:%x:%x",
> +        snprintf(mac, 18, "%02x:%02x:%02x:%02x:%02x:%02x",

Hardcoded 18? How sure are you that this works now?

>                  reqptr->data[0],
>                  reqptr->data[1],
>                  reqptr->data[2],
> @@ -96,15 +97,15 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>              return -1;
>          }
>      }
> -    else if (reqptr->parameter == 6) // Subnet
> +    else if (reqptr->parameter == LAN_PARM_SUBNET) 
>      {
>          sprintf(new_netmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
>      }
> -    else if (reqptr->parameter == 12) // Gateway
> +    else if (reqptr->parameter == LAN_PARM_GATEWAY) 
>      {
>          sprintf(new_gateway, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
>      }
> -    else if (reqptr->parameter == 0) // Apply config
> +    else if (reqptr->parameter == LAN_PARM_INPROGRESS) // Apply config

It is wonderful that you've gone through and given names to these constants and
that you've done this everywhere. I hesitate to mention this but if you're
going to go through and address existing issues, perhaps you could address them
all, those sprintf lines could also benefit from snprintf...

>      {
>          int rc = 0;
>          sd_bus_message *req = NULL;
> @@ -199,7 +200,10 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  {
>      ipmi_ret_t rc = IPMI_CC_OK;
>      *data_len = 0;
> -    sd_bus_error err    = SD_BUS_ERROR_NULL; /* fixme */
> +    sd_bus_message *reply = NULL, *m = NULL;
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    int r = 0;
> +
>      const uint8_t current_revision = 0x11; // Current rev per IPMI Spec 2.0
>  
>      int                 family;
> @@ -209,6 +213,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      char                saddr [128];
>      char                gateway [128];
>      uint8_t             buf[11];
> +    int                 i = 0;
>  
>      printf("IPMI GET_LAN\n");
>  
> @@ -225,28 +230,28 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      // TODO Use dbus interface once available. For now use ip cmd.
>      // TODO Add the rest of the parameters, like gateway
>  
> -    if (reqptr->parameter == 0) // In progress
> +    if (reqptr->parameter == LAN_PARM_INPROGRESS)
>      {
>          uint8_t buf[] = {current_revision,0};
>          *data_len = sizeof(buf);
>          memcpy(response, &buf, *data_len);
>          return IPMI_CC_OK;
>      }
> -    else if (reqptr->parameter == 1) // Authentication support
> +    else if (reqptr->parameter == LAN_PARM_AUTHSUPPORT)
>      {
>          uint8_t buf[] = {current_revision,0x04};
>          *data_len = sizeof(buf);
>          memcpy(response, &buf, *data_len);
>          return IPMI_CC_OK;
>      }
> -    else if (reqptr->parameter == 2) // Authentication enables
> +    else if (reqptr->parameter == LAN_PARM_AUTHENABLES)
>      {
>          uint8_t buf[] = {current_revision,0x04,0x04,0x04,0x04,0x04};
>          *data_len = sizeof(buf);
>          memcpy(response, &buf, *data_len);
>          return IPMI_CC_OK;
>      }
> -    else if (reqptr->parameter == 3) // IP
> +    else if (reqptr->parameter == LAN_PARM_IP)
>      {
>          const char*         device             = "eth0";
>  
> @@ -306,49 +311,58 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  
>          return IPMI_CC_OK;
>      }
> -    else if (reqptr->parameter == 5) // MAC
> +    else if (reqptr->parameter == LAN_PARM_MAC)
>      {
>          //string to parse: link/ether xx:xx:xx:xx:xx:xx
>  
>          const char*         device             = "eth0";
> -        char                eaddr [12];
>          uint8_t             buf[7];
> +        char *eaddr1 = NULL;
>  
> -        sd_bus_message *res = NULL;
> -        sd_bus *bus         = NULL;
> -        sd_bus_error err    = SD_BUS_ERROR_NULL;
> -
> -        rc = sd_bus_open_system(&bus);
> -        if(rc < 0)
> -        {
> -            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> +        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetHwAddress");
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
>              return -1;
>          }
> -
> -        rc = sd_bus_call_method(bus,            // On the System Bus
> -                                app,            // Service to contact
> -                                obj,            // Object path 
> -                                ifc,            // Interface name
> -                                "GetHwAddress",  // Method to be called
> -                                &err,           // object to return error
> -                                &res,           // Response message on success
> -                                "s",         // input message (dev,ip,nm,gw)
> -                                device);
> -        if(rc < 0)
> -        {
> -            fprintf(stderr, "Failed to Get HW address of device : %s\n", device);
> +        r = sd_bus_message_append(m, "s", device);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
>              return -1;
>          }
> -
> -        rc = sd_bus_message_read (res, "s", &eaddr);
> -        if(rc < 0)
> -        {
> -            fprintf(stderr, "Failed to parse gateway from response message:[%s]\n", strerror(-rc));
> +        r = sd_bus_call(bus, m, 0, &error, &reply);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
>              return -1;
>          }
> +        r = sd_bus_message_read(reply, "s", &eaddr1);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to get a response: %s", strerror(-r));
> +            return IPMI_CC_RESPONSE_ERROR;
> +        }
> +        if (eaddr1 == NULL)
> +        {
> +            fprintf(stderr, "Failed to get a valid response: %s", strerror(-r));
> +            return IPMI_CC_RESPONSE_ERROR;
> +        }
>  
>          memcpy((void*)&buf[0], &current_revision, 1);
> -        sscanf (eaddr, "%x:%x:%x:%x:%x:%x", &buf[1], &buf[2], &buf[3], &buf[4], &buf[5], &buf[6]);
> +
> +        char *tokptr = NULL;
> +        char* digit = strtok_r(eaddr1, ":", &tokptr);
> +        if (digit == NULL)
> +        {
> +            fprintf(stderr, "Unexpected MAC format: %s", eaddr1);
> +            return IPMI_CC_RESPONSE_ERROR;
> +        }
> +
> +        i=0;
> +        while (digit != NULL)
> +        {
> +            int resp_byte = strtoul(digit, NULL, 16);
> +            memcpy((void*)&buf[i+1], &resp_byte, 1);
> +            i++;
> +            digit = strtok_r(NULL, ":", &tokptr);
> +        }
>  
>          *data_len = sizeof(buf);
>          memcpy(response, &buf, *data_len);
> diff --git a/transporthandler.h b/transporthandler.h
> index 49b1d95..ce7842b 100644
> --- a/transporthandler.h
> +++ b/transporthandler.h
> @@ -15,4 +15,13 @@ enum ipmi_transport_return_codes
>      IPMI_CC_PARM_NOT_SUPPORTED = 0x80,
>  };
>  
> +// Parameters
> +static const int LAN_PARM_INPROGRESS  = 0;
> +static const int LAN_PARM_AUTHSUPPORT = 1;
> +static const int LAN_PARM_AUTHENABLES = 2;
> +static const int LAN_PARM_IP          = 3;
> +static const int LAN_PARM_MAC         = 5;
> +static const int LAN_PARM_SUBNET      = 6;
> +static const int LAN_PARM_GATEWAY     = 12;
> +
>  #endif
