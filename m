Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 1C7BA1A0191
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 12:32:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=bZMyj2Fd; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id DB22845807B;
 Mon,  8 Feb 2016 17:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=86/17jJaQ5CuBEEBn4GoU6LT11I=; b=bZMyj2Fd/z4A3BTmTg1I76OBDur
 nw9grkg7GbXupwKRz2P9d9VZSqmOjTp0bfAxv/UGiuzlNnxcccCEDGUXqTjYsMGX
 G5QhhYTvXIJD4p/VgXT4DtKiWKdGm+rLaFLwbebjfF+GITlZPQHrk3oElmyLmTr4
 Pw0l0UZsiesPZXW4=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 193B9458079;
 Mon,  8 Feb 2016 17:32:27 -0800 (PST)
Message-ID: <1454981545.3153.17.camel@aj.id.au>
Subject: Re: [PATCH phosphor-host-ipmid] Get MAC address
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 09 Feb 2016 12:02:25 +1030
In-Reply-To: <1454974827-10588-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454974827-10588-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454974827-10588-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 09 Feb 2016 01:32:30 -0000

Hi Adriana,

Can you please split the patch to address the review comments
separately from adding the Get MAC support?

This will make the changes easier to understand and review.

Cheers,

Andrew

On Mon, 2016-02-08 at 17:40 -0600, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
> 
> Support for Get MAC address command.
> Address review comments from Set MAC command.
> ---
>  transporthandler.C | 100 ++++++++++++++++++++++++++++++-------------
> ----------
>  transporthandler.h |   9 +++++
>  2 files changed, 66 insertions(+), 43 deletions(-)
> 
> diff --git a/transporthandler.C b/transporthandler.C
> index c38adea..0ef818d 100644
> --- a/transporthandler.C
> +++ b/transporthandler.C
> @@ -52,6 +52,10 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t
> netfn, ipmi_cmd_t cmd,
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
> @@ -61,18 +65,15 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t
> netfn, ipmi_cmd_t cmd,
>      // TODO Add the rest of the parameters like setting auth type
>      // TODO Add error handling
>  
> -    if (reqptr->parameter == 3) // IP
> +    if (reqptr->parameter == LAN_PARM_IP)
>      {
>          sprintf(new_ipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr
> ->data[1], reqptr->data[2], reqptr->data[3]);
>      }
> -    else if (reqptr->parameter == 5) // MAC
> +    else if (reqptr->parameter == LAN_PARM_MAC)
>      {
>          char                mac[18];
> -        sd_bus_message *reply = NULL, *m = NULL;
> -        sd_bus_error error = SD_BUS_ERROR_NULL;
> -        int r = 0;
>  
> -        sprintf(mac, "%x:%x:%x:%x:%x:%x",
> +        snprintf(mac, 18, "%02x:%02x:%02x:%02x:%02x:%02x",
>                  reqptr->data[0],
>                  reqptr->data[1],
>                  reqptr->data[2],
> @@ -96,15 +97,15 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t
> netfn, ipmi_cmd_t cmd,
>              return -1;
>          }
>      }
> -    else if (reqptr->parameter == 6) // Subnet
> +    else if (reqptr->parameter == LAN_PARM_SUBNET) 
>      {
>          sprintf(new_netmask, "%d.%d.%d.%d", reqptr->data[0], reqptr
> ->data[1], reqptr->data[2], reqptr->data[3]);
>      }
> -    else if (reqptr->parameter == 12) // Gateway
> +    else if (reqptr->parameter == LAN_PARM_GATEWAY) 
>      {
>          sprintf(new_gateway, "%d.%d.%d.%d", reqptr->data[0], reqptr
> ->data[1], reqptr->data[2], reqptr->data[3]);
>      }
> -    else if (reqptr->parameter == 0) // Apply config
> +    else if (reqptr->parameter == LAN_PARM_INPROGRESS) // Apply
> config
>      {
>          int rc = 0;
>          sd_bus_message *req = NULL;
> @@ -199,7 +200,10 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t
> netfn, ipmi_cmd_t cmd,
>  {
>      ipmi_ret_t rc = IPMI_CC_OK;
>      *data_len = 0;
> -    sd_bus_error err    = SD_BUS_ERROR_NULL; /* fixme */
> +    sd_bus_message *reply = NULL, *m = NULL;
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    int r = 0;
> +
>      const uint8_t current_revision = 0x11; // Current rev per IPMI
> Spec 2.0
>  
>      int                 family;
> @@ -209,6 +213,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t
> netfn, ipmi_cmd_t cmd,
>      char                saddr [128];
>      char                gateway [128];
>      uint8_t             buf[11];
> +    int                 i = 0;
>  
>      printf("IPMI GET_LAN\n");
>  
> @@ -225,28 +230,28 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t
> netfn, ipmi_cmd_t cmd,
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
> @@ -306,49 +311,58 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t
> netfn, ipmi_cmd_t cmd,
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
> +        r =
> sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetHwAddress");
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to add method object: %s\n",
> strerror(-r));
>              return -1;
>          }
> -
> -        rc = sd_bus_call_method(bus,            // On the System Bus
> -                                app,            // Service to
> contact
> -                                obj,            // Object path 
> -                                ifc,            // Interface name
> -                                "GetHwAddress",  // Method to be
> called
> -                                &err,           // object to return
> error
> -                                &res,           // Response message
> on success
> -                                "s",         // input message
> (dev,ip,nm,gw)
> -                                device);
> -        if(rc < 0)
> -        {
> -            fprintf(stderr, "Failed to Get HW address of device :
> %s\n", device);
> +        r = sd_bus_message_append(m, "s", device);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to append message data: %s\n",
> strerror(-r));
>              return -1;
>          }
> -
> -        rc = sd_bus_message_read (res, "s", &eaddr);
> -        if(rc < 0)
> -        {
> -            fprintf(stderr, "Failed to parse gateway from response
> message:[%s]\n", strerror(-rc));
> +        r = sd_bus_call(bus, m, 0, &error, &reply);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to call method: %s\n", strerror(
> -r));
>              return -1;
>          }
> +        r = sd_bus_message_read(reply, "s", &eaddr1);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to get a response: %s",
> strerror(-r));
> +            return IPMI_CC_RESPONSE_ERROR;
> +        }
> +        if (eaddr1 == NULL)
> +        {
> +            fprintf(stderr, "Failed to get a valid response: %s",
> strerror(-r));
> +            return IPMI_CC_RESPONSE_ERROR;
> +        }
>  
>          memcpy((void*)&buf[0], &current_revision, 1);
> -        sscanf (eaddr, "%x:%x:%x:%x:%x:%x", &buf[1], &buf[2],
> &buf[3], &buf[4], &buf[5], &buf[6]);
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
