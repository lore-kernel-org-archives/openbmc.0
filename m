Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x22d.google.com (mail-ob0-x22d.google.com
 [IPv6:2607:f8b0:4003:c01::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43C921A01DF
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 11:57:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=m+CGmQNL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=K7PSZCBT; 
 dkim-atps=neutral
Received: by obbww6 with SMTP id ww6so45767407obb.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Dec 2015 16:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type:content-transfer-encoding;
 bh=lr+Zux07rFyKwmOmK4MIrngyY5Al9dOi2Dr7CsaXCRs=;
 b=m+CGmQNLieFw/rX7Y76Gfsvrgh1vRsclKa1u8uWEMHuqo5XPtqqr9dOKrT32DqBZY/
 pLerS5lQ1qveyLMplPh/VQ6/btRkgqIiTjnin4C7hUcxAhgYW8qAHTUD3zCFHpaSSTqs
 xTH1em4ThmBp1MoOFEkQH0lrWcL8EyZouCTPKEPsjBnbj9K8smghpkyyQfG585FEyjMr
 Jl7Rzpoc7iOtBfCBYiZwb5ApVlYcPKQ+Jjh188WJI+dIQbYpeM5iizK2thhKpygTWF61
 uDJtahg6WoeY+3qZkhhkL6lDe3F2CoOPo7jsizmNjQEsbE5/2CdIvK2Ud8oq3LN+zgdw
 IUpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type:content-transfer-encoding;
 bh=lr+Zux07rFyKwmOmK4MIrngyY5Al9dOi2Dr7CsaXCRs=;
 b=K7PSZCBTw4OE9G3mBj1z4RuJrQs1aQNt8kWyZrgCdnJBPyzOsBMTLvGyrOdrgHwJzB
 MqYAaGNZf/pwbZk6HQlOW3TbgrdfbMYr2L9nYpD88f8APvmbfIceFB6sz6VyAV9Ik16u
 XpYHMGBoMColBIVzOQy55htseVN8+xYz6vNnU=
X-Received: by 10.60.85.34 with SMTP id e2mr5887937oez.61.1449104237885; Wed,
 02 Dec 2015 16:57:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.226.10 with HTTP; Wed, 2 Dec 2015 16:56:58 -0800 (PST)
In-Reply-To: <1449102026-16402-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449102026-16402-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1449102026-16402-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Dec 2015 11:26:58 +1030
X-Google-Sender-Auth: zwikd2i0QCH_GMGmz9jf5SXRiSY
Message-ID: <CACPK8XcFL8UjQJLdHYC3mj76iOnOzEgkzjLvAkuFzTn=rcAsHQ@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid] Alignment and double error
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 03 Dec 2015 00:57:22 -0000

On Thu, Dec 3, 2015 at 10:50 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Chris Austen <austenc@us.ibm.com>
>
> Fixed a pointer pointer issue where no one had the storage for a uint16_t
> Fixed the double error log on palmetto systems needed a reconfig loop

These unrelated changes should be two separate commits.

> ---
>  ipmid.C         | 19 ++++++++++---------
>  sensorhandler.C | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  sensorhandler.h |  1 +
>  storageaddsel.C | 30 ++++++------------------------
>  4 files changed, 65 insertions(+), 33 deletions(-)
>
> diff --git a/ipmid.C b/ipmid.C
> index f1f938c..5b17036 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -186,7 +186,7 @@ static int send_ipmi_message(sd_bus_message *req, uns=
igned char seq, unsigned ch
>
>      r =3D sd_bus_message_new_method_call(bus,&m,dest,path,DBUS_INTF,"sen=
dMessage");
>      if (r < 0) {
> -        fprintf(stderr, "Failed to add the method object: %s\n", strerro=
r(-r));
> +        fprintf(stderr, "Failed to add the method object: %s %s\n", __FU=
NCTION__, strerror(-r));
>          return -1;
>      }
>
> @@ -198,14 +198,14 @@ static int send_ipmi_message(sd_bus_message *req, u=
nsigned char seq, unsigned ch
>      // Add the bytes needed for the methods to be called
>      r =3D sd_bus_message_append(m, "yyyyy", seq, netfn, lun, cmd, cc);
>      if (r < 0) {
> -        fprintf(stderr, "Failed add the netfn and others : %s\n", strerr=
or(-r));
> -        return -1;
> +        fprintf(stderr, "Failed add the netfn and others : %s %s\n", __F=
UNCTION__, strerror(-r));
> +        goto final;
>      }
>
>      r =3D sd_bus_message_append_array(m, 'y', buf, len);
>      if (r < 0) {
> -        fprintf(stderr, "Failed to add the string of response bytes: %s\=
n", strerror(-r));
> -        return -1;
> +        fprintf(stderr, "Failed to add the string of response bytes: %s =
%s\n", __FUNCTION__, strerror(-r));
> +        goto final;
>      }
>
>
> @@ -213,18 +213,19 @@ static int send_ipmi_message(sd_bus_message *req, u=
nsigned char seq, unsigned ch
>      // Call the IPMI responder on the bus so the message can be sent to =
the CEC
>      r =3D sd_bus_call(bus, m, 0, &error, &reply);
>      if (r < 0) {
> -        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
> -        return -1;
> +        fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION=
__, strerror(-r));
> +        goto final;
>      }
>
>      r =3D sd_bus_message_read(reply, "x", &pty);
>      if (r < 0) {
> -       fprintf(stderr, "Failed to get a rc from the method: %s\n", strer=
ror(-r));
> -
> +       fprintf(stderr, "Failed to get a rc from the method: %s %s\n", __=
FUNCTION__, strerror(-r));
>      }
>
> +final:
>      sd_bus_error_free(&error);
>      sd_bus_message_unref(m);
> +    sd_bus_message_unref(reply);
>
>
>      return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> diff --git a/sensorhandler.C b/sensorhandler.C
> index dd83152..131da71 100644
> --- a/sensorhandler.C
> +++ b/sensorhandler.C
> @@ -29,6 +29,7 @@ sensorTypemap_t g_SensorTypeMap[] =3D {
>      {0xe9, 0x09, "OccStatus"},  // E9 is an internal mapping to handle s=
ensor type code os 0x09
>      {0xC3, 0x6F, "BootCount"},
>      {0x1F, 0x6F, "OperatingSystemStatus"},
> +    {0x12, 0x6F, "SYSTEM"},
>      {0xFF, 0x00, ""},
>  };
>
> @@ -39,6 +40,14 @@ struct sensor_data_t {
>  }  __attribute__ ((packed)) ;
>
>
> +struct sensor_reading_ret_t {
> +    uint8_t reading;
> +    uint8_t options;
> +    uint8_t assert[2];
> +}  __attribute__ ((packed)) ;
> +
> +
> +

Whitespace

>  uint8_t dbus_to_sensor_type(char *p) {
>
>      sensorTypemap_t *s =3D g_SensorTypeMap;
> @@ -155,6 +164,42 @@ ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, i=
pmi_cmd_t cmd,
>      return rc;
>  }
>
> +

Whitespace

> +ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cm=
d,
> +                             ipmi_request_t request, ipmi_response_t res=
ponse,
> +                             ipmi_data_len_t data_len, ipmi_context_t co=
ntext)
> +{
> +    sensor_data_t *reqptr =3D (sensor_data_t*)request;
> +    sensor_reading_ret_t ret;
> +    ipmi_ret_t rc;
> +
> +    printf("IPMI GET_SENSOR_READING [0x%02x]\n",reqptr->sennum);
> +
> +

Whitespace

> +    // TODO Call dbus method to get teh real state of the sensor and
> +    // translate it to IPMI.  For now stop every boot of a Palmetto
> +    // from creating error logs about missing the Reboot Sensor.
> +    if (reqptr->sennum =3D=3D 9) {

Give the magic number a name.

> +        ret.reading =3D 2;

Again, what does 2 mean?

> +        ret.options =3D 0;
> +        ret.assert[0] =3D 0;
> +        ret.assert[1] =3D 0;
> +
> +        *data_len =3D sizeof(ret);
> +        memcpy(response, &ret, *data_len);

Is there a reason why you create the local ret, and then copy the
results in to response? Could you just put the data straight into
response?

> +        rc =3D IPMI_CC_OK;
> +
> +    } else {
> +        *data_len =3D 0;
> +        rc =3D IPMI_CC_SENSOR_INVALID;
> +    }
> +
> +

Whitespace

> +    return rc;
> +}
> +
> +
> +

Whitespace.

>  ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>                               ipmi_request_t request, ipmi_response_t res=
ponse,
>                               ipmi_data_len_t data_len, ipmi_context_t co=
ntext)
> @@ -179,5 +224,8 @@ void register_netfn_sen_functions()
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_=
CMD_SET_SENSOR);
>      ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_SET_SENSOR, NULL, ipm=
i_sen_set_sensor);
>
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_=
CMD_GET_SENSOR_READING);
> +    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_READING, N=
ULL, ipmi_sen_get_sensor_reading);
> +
>      return;

This is redundant.

>  }
> diff --git a/sensorhandler.h b/sensorhandler.h
> index 7b89a18..dd940dc 100644
> --- a/sensorhandler.h
> +++ b/sensorhandler.h
> @@ -6,6 +6,7 @@
>  // IPMI commands for net functions.
>  enum ipmi_netfn_sen_cmds
>  {
> +    IPMI_CMD_GET_SENSOR_READING =3D 0x2D,
>      IPMI_CMD_GET_SENSOR_TYPE =3D 0x2F,
>      IPMI_CMD_SET_SENSOR      =3D 0x30,
>  };
> diff --git a/storageaddsel.C b/storageaddsel.C
> index 345dfd5..991c78d 100644
> --- a/storageaddsel.C
> +++ b/storageaddsel.C
> @@ -155,7 +155,7 @@ int send_esel_to_dbus(const char *desc, const char *s=
ev, const char *details, ui
>         sd_bus *mbus =3D NULL;
>      sd_bus_error error =3D SD_BUS_ERROR_NULL;
>      sd_bus_message *reply =3D NULL, *m=3DNULL;
> -    uint16_t *pty;
> +    uint16_t x;

Use a more descriptive name than "x".

>      int r;
>
>      mbus =3D ipmid_get_sd_bus_connection();
> @@ -181,26 +181,22 @@ int send_esel_to_dbus(const char *desc, const char =
*sev, const char *details, ui
>          fprintf(stderr, "Failed to add the raw array of bytes: %s\n", st=
rerror(-r));
>          return -1;
>      }
> -
>      // Call the IPMI responder on the bus so the message can be sent to =
the CEC
>      r =3D sd_bus_call(mbus, m, 0, &error, &reply);
>      if (r < 0) {
> -        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
> +        fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION=
__, strerror(-r));

Systemd gives us a string in error->message. You could print that
instead of strerror.

>          return -1;
>      }
> -
> -    r =3D sd_bus_message_read(reply, "q", &pty);
> +    r =3D sd_bus_message_read(reply, "q", &x);
>      if (r < 0) {
>          fprintf(stderr, "Failed to get a rc from the method: %s\n", stre=
rror(-r));
> -    } else {
> -        r =3D *pty;
>      }
>
> +finish:

storageaddsel.C:195:1: warning: label =E2=80=98finish=E2=80=99 defined but =
not used
[-Wunused-label]
 finish:
 ^

>      sd_bus_error_free(&error);
>      sd_bus_message_unref(m);
>      sd_bus_message_unref(reply);
> -
> -    return r;
> +    return 0;

This function will print an error message when sd_bus_message_read
fails, but will always return zero now. Is that the intention?

>  }
>
>
> @@ -213,41 +209,27 @@ void send_esel(uint16_t recordid) {
>         int r;
>
>         uint8_t hack[] =3D {0x30, 0x32, 0x34};
> -
>         asprintf(&path,"%s%04x", "/tmp/esel", recordid);
> -
>         sz =3D getfilestream(path, &buffer);
> -
>         if (sz =3D=3D 0) {
>                 printf("Error file does not exist %d\n",__LINE__);
>                 free(path);
>                 return;
>         }
>
> -
>         sev =3D create_esel_severity(buffer);
> -
>         create_esel_association(buffer, &assoc);
> -
>         create_esel_description(buffer, sev, &desc);
>
> -
>         // TODO until ISSUE https://github.com/openbmc/rest-dbus/issues/2
>         // I cant send extended ascii chars.  So 0,2,4 for now...
> -       r =3D send_esel_to_dbus(desc, sev, assoc, hack, 3);
> -
> -       asprintf(&pathsent,"%s_%d", path, r);
> -
> -
> -       rename(path, pathsent);

storageaddsel.C: In function =E2=80=98void send_esel(uint16_t)=E2=80=99:
storageaddsel.C:209:6: warning: unused variable =E2=80=98r=E2=80=99 [-Wunus=
ed-variable]
  int r;
      ^
storageaddsel.C:229:16: warning: =E2=80=98pathsent=E2=80=99 may be used uni=
nitialized
in this function [-Wmaybe-uninitialized]
  free(pathsent);
                ^
storageaddsel.C:207:15: note: =E2=80=98pathsent=E2=80=99 was declared here
  char *path, *pathsent;
               ^

> +       send_esel_to_dbus(desc, sev, assoc, hack, 3);
>
>         free(path);
>         free(pathsent);
>         free(assoc);
>         free(desc);
> -
>         delete[] buffer;
>
> -
>         return;
>  }
> --
> 2.6.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
