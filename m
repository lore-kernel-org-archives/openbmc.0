Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2D23D1A0030
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 15:48:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=l6DZy/i+; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id 65so1257584pfd.1
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 20:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=60vDq/1P0AmJXNPzp42atX8TLnRVrm5Vk0QVQ1RGr+U=;
 b=l6DZy/i+OLgc4ElirAc324iBT4IO8EWPzbcBg2Z+t3YAtPNaJNeqD6uWfLUN776byO
 3gogYF/DGqPIkCtb3c6ODu+sy13P89aHmaunsGHIGvDzJjWO0rCmWgMoxJFobOfNfWAX
 3pcsGI47CEzgGMBYeIDq23u3xPee4zaHKZmv+52e9YTLYuE0k2PzpmCQ9mvBlm22EXla
 V/V4Ngca7IL/bT4psz4KNbmNB9H5f7rZN6iyyYsuXcjZ0wUbqmkcnvz/B5Aq5SUjQ8tw
 FQTRKKybN989S2Ne3CbUW3LHpqv3Y1KfC3jEWJkaB7kr/sg3/BBXAZtokymsw1ML+7Tn
 tejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=60vDq/1P0AmJXNPzp42atX8TLnRVrm5Vk0QVQ1RGr+U=;
 b=gqYRJgIbg2CawnCNNIgnm2bwJSO6wRA6DIS9kDE97fZ8LOYHv9t0g2p/DzMur48zbK
 /qSf19bugXyYJuKC6N/CIl31OoFj4imPz14cdhWS9as1MM84z0/TCU+dnRsqrGSypULn
 O/QF/DQ3YCorC/NAjMgzpVI+ts85NIXvhFdZOChelD9rlvyw0D+j6o5evKNProYAaTLB
 HP/8vvHzSRmRwLuBkJRHpVcF1A3woWB3fGdPNX28BOaU1O7MU/YzRePmkhZBeOfuigA2
 6nXGnDKQagZbAfx/4sCdgaNqFDszWYnbW0v7tOwyFZhShT/ez5UoFZB/prxYLiogvxtJ
 LGcg==
X-Gm-Message-State: ALoCoQl92UMBpJhmLBljYNtKRptSHuNmKyBrov043zHH2zfZt+r2nP4z8P1YuGcHTmx4ojjjyJaN668swelAgiK4CalGbt8TxA==
X-Received: by 10.98.13.7 with SMTP id v7mr57725695pfi.150.1453351692041;
 Wed, 20 Jan 2016 20:48:12 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 68sm52047717pfa.78.2016.01.20.20.48.10
 (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 20 Jan 2016 20:48:11 -0800 (PST)
Date: Thu, 21 Jan 2016 15:48:02 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Using systemd dbus API to set get
 LAN parameters.
Message-ID: <20160121154802.3183fc4a@camb691>
In-Reply-To: <1453296028-21095-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453296028-21095-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453296028-21095-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 21 Jan 2016 04:48:17 -0000

On Wed, 20 Jan 2016 07:20:28 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

Hi Hariharasubramanian,

I have a few questions about this patch.


Firstly, I notice you've removed all the calls to popen() and I can't see a=
ny
functional equivalent. Unfortunately there is no commit message so I don't =
know
if you meant to remove them and not replace them. Thought I had to check.


> From: Hariharasubramanian R <hramasub@in.ibm.com>
>=20
> ---
>  transporthandler.C | 233 +++++++++++++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 191 insertions(+), 42 deletions(-)
>=20
> diff --git a/transporthandler.C b/transporthandler.C
> index 0f7a730..dac8fe8 100644
> --- a/transporthandler.C
> +++ b/transporthandler.C
> @@ -1,11 +1,31 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdint.h>
> +#include <arpa/inet.h>
> =20
>  #include "ipmid-api.h"
>  #include "ipmid.H"
>  #include "transporthandler.h"
> =20
> +#define SYSTEMD_NETWORKD_DBUS 1
> +
> +#ifdef SYSTEMD_NETWORKD_DBUS
> +#include <systemd/sd-bus.h>
> +#endif

Why even have the SYSTEMD_NETWORKD_DBUS?

> +
> +// OpenBMC System Manager dbus framework
> +const char  *app   =3D  "org.openbmc.NetworkManager";
> +const char  *obj   =3D  "/org/openbmc/NetworkManager/Interface";
> +const char  *ifc   =3D  "org.openbmc.NetworkManager";
> +
> +char cur_ipaddr  [16] =3D "";
> +char cur_netmask [16] =3D "";
> +char cur_gateway [16] =3D "";
> +
> +char new_ipaddr  [16] =3D "";
> +char new_netmask [16] =3D "";
> +char new_gateway [16] =3D "";
> +

Why are you declaring these globally?

>  void register_netfn_transport_functions() __attribute__((constructor));
> =20
>  ipmi_ret_t ipmi_transport_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> @@ -31,7 +51,6 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, i=
pmi_cmd_t cmd,
>  {
>      ipmi_ret_t rc =3D IPMI_CC_OK;
>      *data_len =3D 0;
> -    char syscmd[128];
> =20
>      printf("IPMI SET_LAN\n");
> =20
> @@ -43,18 +62,88 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn,=
 ipmi_cmd_t cmd,
> =20
>      if (reqptr->parameter =3D=3D 3) // IP
>      {
> -        sprintf(syscmd, "ifconfig eth0 %d.%d.%d.%d", reqptr->data[0], re=
qptr->data[1], reqptr->data[2], reqptr->data[3]);
> -        system(syscmd);
> +        sprintf(new_ipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->data=
[1], reqptr->data[2], reqptr->data[3]);
>      }
>      else if (reqptr->parameter =3D=3D 6) // Subnet
>      {
> -        sprintf(syscmd, "ifconfig eth0 netmask %d.%d.%d.%d", reqptr->dat=
a[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
> -        system(syscmd);
> +        sprintf(new_netmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->dat=
a[1], reqptr->data[2], reqptr->data[3]);
>      }
>      else if (reqptr->parameter =3D=3D 12) // Gateway
>      {
> -        sprintf(syscmd, "route add default gw %d.%d.%d.%d", reqptr->data=
[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
> -        system(syscmd);
> +        sprintf(new_gateway, "%d.%d.%d.%d", reqptr->data[0], reqptr->dat=
a[1], reqptr->data[2], reqptr->data[3]);
> +    }
> +    else if (reqptr->parameter =3D=3D 0) // Apply config
> +    {
> +        int rc =3D 0;
> +        sd_bus_message *req =3D NULL;
> +        sd_bus_message *res =3D NULL;
> +        sd_bus *bus         =3D NULL;
> +        sd_bus_error err    =3D SD_BUS_ERROR_NULL;
> +       =20
> +        if (!strcmp(new_ipaddr, "") || !strcmp (new_netmask, "") || !str=
cmp (new_gateway, ""))
> +        {



> +            fprintf(stderr,"ERROR: Incomplete LAN Parameters\n");
> +            return -1;
> +        }
> +           =20
> +        rc =3D sd_bus_open_system(&bus);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> +            return -1;
> +        }
> +
> +        if (strcmp(cur_ipaddr, ""))
> +        {
> +            sd_bus_error_free(&err);
> +            sd_bus_message_unref(req);
> +            sd_bus_message_unref(res);
> +
> +            rc =3D sd_bus_call_method(bus,            // On the System B=
us
> +                                    app,            // Service to contact
> +                                    obj,            // Object path=20
> +                                    ifc,            // Interface name
> +                                    "DelAddress4",  // Method to be call=
ed
> +                                    &err,           // object to return =
error
> +                                    &res,           // Response message =
on success
> +                                    "ssss",         // input message (de=
v,ip,nm,gw)
> +                                    "eth0",
> +                                    cur_ipaddr,
> +                                    cur_netmask,
> +                                    cur_gateway);

So here it becomes quite clear that all that (possibly error prone) sprintf
earlier was simply so you can send the addresses over dbus.

Perhaps you chould just pass the reqptr->data[] values as they are?


> +        }
> +
> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to remove existing IP %s: %s\n", cur=
_ipaddr, err.message);
> +            return -1;
> +        }
> +
> +        sd_bus_error_free(&err);
> +        sd_bus_message_unref(req);
> +        sd_bus_message_unref(res);
> +
> +        rc =3D sd_bus_call_method(bus,            // On the System Bus
> +                                app,            // Service to contact
> +                                obj,            // Object path=20
> +                                ifc,            // Interface name
> +                                "AddAddress4",  // Method to be called
> +                                &err,           // object to return error
> +                                &res,           // Response message on s=
uccess
> +                                "ssss",         // input message (dev,ip=
,nm,gw)
> +                                "eth0",
> +                                new_ipaddr,
> +                                new_netmask,
> +                                new_gateway);

See my previous comment.

> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to set IP %s: %s\n", new_ipaddr, err=
.message);
> +            return -1;
> +        }
> +
> +        strcpy (cur_ipaddr, new_ipaddr);
> +        strcpy (cur_netmask, new_netmask);
> +        strcpy (cur_gateway, new_gateway);
>      }
>      else
>      {
> @@ -78,10 +167,16 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn=
, ipmi_cmd_t cmd,
>  {
>      ipmi_ret_t rc =3D IPMI_CC_OK;
>      *data_len =3D 0;
> -
> +    sd_bus_error err    =3D SD_BUS_ERROR_NULL; /* fixme */

What is going to need fixing exactly?

>      const uint8_t current_revision =3D 0x11; // Current rev per IPMI Spe=
c 2.0
> -    char syscmd[128];
> -    int i =3D 0;
> +
> +    int                 family;
> +    unsigned char       prefixlen;
> +    unsigned char       scope;
> +    unsigned int        flags;
> +    char                saddr [128];
> +    char                gateway [128];
> +    uint8_t             buf[11];
> =20
>      printf("IPMI GET_LAN\n");
> =20
> @@ -121,56 +216,111 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t net=
fn, ipmi_cmd_t cmd,
>      }
>      else if (reqptr->parameter =3D=3D 3) // IP

See my other comment about this

>      {
> -        //string to parse: inet xx.xx.xxx.xxx/xx
> +        const char*         device             =3D "eth0";
> =20
> -        uint8_t buf[5];
> -        memcpy((void*)&buf[0], &current_revision, 1);
> +        sd_bus_message *res =3D NULL;
> +        sd_bus *bus         =3D NULL;
> +        sd_bus_error err    =3D SD_BUS_ERROR_NULL;
> +
> +        rc =3D sd_bus_open_system(&bus);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> +            return -1;
> +        }
> =20
> -        for (i=3D0; i<4; i++)
> +        rc =3D sd_bus_call_method(bus,            // On the System Bus
> +                                app,            // Service to contact
> +                                obj,            // Object path=20
> +                                ifc,            // Interface name
> +                                "GetAddress4",  // Method to be called
> +                                &err,           // object to return error
> +                                &res,           // Response message on s=
uccess
> +                                "s",         // input message (dev,ip,nm=
,gw)
> +                                "eth0");
> +        if(rc < 0)
>          {
> -            char ip[5];
> -
> -            sprintf(syscmd, "ip address show dev eth0|grep inet|cut -d'/=
' -f1|cut -d' ' -f 6|cut -d'.' -f%d|head -n1", i+1);
> -            FILE *fp =3D popen(syscmd, "r");
> -
> -            memset(ip,0,sizeof(ip));
> -            while (fgets(ip, sizeof(ip), fp) !=3D 0)
> -            {
> -                int tmpip =3D strtoul(ip, NULL, 10);
> -                memcpy((void*)&buf[i+1], &tmpip, 1);
> -            }
> -            pclose(fp);
> +            fprintf(stderr, "Failed to Get IP on interface : %s\n", devi=
ce);
> +            return -1;
> +        }
> +
> +        /* rc =3D sd_bus_message_read(res, "a(iyyus)s", ...); */

Delete that line?

> +        rc =3D sd_bus_message_enter_container (res, 'a', "(iyyus)");
> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to parse response message:[%s]\n", s=
trerror(-rc));
> +            return -1;
> +        }
> +
> +        while ((rc =3D sd_bus_message_read(res, "(iyyus)", &family, &pre=
fixlen, &scope, &flags, &saddr)) > 0) {
> +                printf("%s:%d:%d:%d:%s\n", family=3D=3DAF_INET?"IPv4":"I=
Pv6", prefixlen, scope, flags, saddr);
>          }

Again, I bet there is someone sprintf()ing in order to pass saddr as a stri=
ng
requiring you to do a sscanf() just a bit further, this makes no sense!

> =20
> +        rc =3D sd_bus_message_read (res, "s", &gateway);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to parse gateway from response messa=
ge:[%s]\n", strerror(-rc));
> +            return -1;
> +        }
> +
> +        memcpy((void*)&buf[0], &current_revision, 1);
> +        sscanf (saddr, "%c.%c.%c.%c", &buf[1], &buf[2], &buf[3], &buf[4]=
);
> +        buf[5] =3D family;
> +        buf[6] =3D prefixlen;
> +        sscanf (gateway, "%c.%c.%c.%c", &buf[7], &buf[8], &buf[9], &buf[=
10]);
> +

=46rom man 3 scanf:

       c      Matches a sequence of characters whose length is specified by=
 the
       maximum field width (default 1); the next pointer must be a pointer =
to
       char, and there must be enough room for all the  charac- ters (no
       terminating null byte is added).  The usual skip of leading white sp=
ace
       is suppressed.  To skip white space first, use an explicit space in =
the
       format.

To conclude the %c will only match 0-9. Unless someone is passing around
'addresses' in the form of A.B.C.D which is horrifying me but I suppose cou=
ld
work... but NO!

However, this isn't the biggest problem we have here - I ask the question
again, why are strings being used to represent these when dbus is perfectly
capable of a variety of different types.

>          *data_len =3D sizeof(buf);
>          memcpy(response, &buf, *data_len);
> +
>          return IPMI_CC_OK;
>      }
>      else if (reqptr->parameter =3D=3D 5) // MAC
>      {

I know this isn't in the scope of this patch but perhaps we could stop with=
 the
magic numbers...

>          //string to parse: link/ether xx:xx:xx:xx:xx:xx
> =20
> -        uint8_t buf[7];
> -        memcpy((void*)&buf[0], &current_revision, 1);
> +        const char*         device             =3D "eth0";

Why did you even declare device? Perhaps consider #defineing it?

> +        char                eaddr [12];
> +        uint8_t             buf[7];
> +
> +        sd_bus_message *res =3D NULL;
> +        sd_bus *bus         =3D NULL;
> +        sd_bus_error err    =3D SD_BUS_ERROR_NULL;
> +
> +        rc =3D sd_bus_open_system(&bus);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> +            return -1;
> +        }
> +
> +        rc =3D sd_bus_call_method(bus,            // On the System Bus
> +                                app,            // Service to contact
> +                                obj,            // Object path=20
> +                                ifc,            // Interface name
> +                                "GetHwAddress",  // Method to be called
> +                                &err,           // object to return error
> +                                &res,           // Response message on s=
uccess
> +                                "s",         // input message (dev,ip,nm=
,gw)
> +                                device);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to Get HW address of device : %s\n",=
 device);
> +            return -1;
> +        }
> =20
> -        for (i=3D0; i<6; i++)
> +        rc =3D sd_bus_message_read (res, "s", &eaddr);
> +        if(rc < 0)
>          {
> -            char mac[4];
> -
> -            sprintf(syscmd, "ip address show dev eth0|grep link|cut -d' =
' -f 6|cut -d':' -f%d", i+1);
> -            FILE *fp =3D popen(syscmd, "r");
> -
> -            memset(mac,0,sizeof(mac));
> -            while (fgets(mac, sizeof(mac), fp) !=3D 0)
> -            {
> -                int tmpmac =3D strtoul(mac, NULL, 16);
> -                memcpy((void*)&buf[i+1], &tmpmac, 1);
> -            }
> -            pclose(fp);
> +            fprintf(stderr, "Failed to parse gateway from response messa=
ge:[%s]\n", strerror(-rc));
> +            return -1;
>          }
> =20
> +        memcpy((void*)&buf[0], &current_revision, 1);
> +        sscanf (eaddr, "%x:%x:%x:%x:%x:%x", &buf[1], &buf[2], &buf[3], &=
buf[4], &buf[5], &buf[6]);
> +

... and again ...

>          *data_len =3D sizeof(buf);
>          memcpy(response, &buf, *data_len);
> +
>          return IPMI_CC_OK;
>      }
>      else
> @@ -195,4 +345,3 @@ void register_netfn_transport_functions()
> =20
>      return;
>  }
> -
