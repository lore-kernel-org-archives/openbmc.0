Return-Path: <cyrilbur@gmail.com>
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A8CD01A01D8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 16:25:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WmFt2aAB; 
 dkim-atps=neutral
Received: by mail-io0-x242.google.com with SMTP id f81so259511iof.0
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2016 21:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-type;
 bh=2bG1D36C+fujX8Qn+ipgPnKj90C/qVYyQCQEJbU1JXc=;
 b=WmFt2aABfpBWVLFDIqOD5OZ6FtFEw+lPyw4qV5nRVd5E9TXeou5emxIC2+6gq/0+td
 y3TS9ZJjsn3VKUWbA8lYKzZ+M1PtF9XK5Diwl4i+kwzP2NNyMq3W+uLaCteWHixbi/oo
 FK+JcP3gfl8Kwk6HjFSN5Sjen+FaHUgxBQXmNKKafDM1RkCGuEhTGhM2OROvYZTh3kbv
 Qd1zpGkcXNEehlLe8/DL3tr4CWQUIsEgXG6dYvqTnvEb/O4dtoTdBjuAIv5nSKPeD1ad
 zQZt3oBhY4fTgW6TD/iHcoxD9K+cPxBrAEnVxN+sJhppHe0yeJX+7MZeCv9b+3BezeXC
 CgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-type;
 bh=2bG1D36C+fujX8Qn+ipgPnKj90C/qVYyQCQEJbU1JXc=;
 b=RrrXM47yyjznO1rpWwEoY7KHJVrQY/M5hdqI8sMP7tt3vkuWNPFhL2YslI5VaXyfEt
 X9Vgee8YBwnsI8wX+m8GQiGA7r6h7vTd1hRi092zE1blv9ULlKDO6vbmzEhHCK6DXpoq
 r5M2bxx1scZYBSvH3Khl2xuY6o7LlbUHqIMbalufrrGexHBXKHsTVZ/unrU1rCh3bgCW
 5LELg+l+lwijJZmy+hJb5yPlv+SlMh/BUqMf5dkI81GWc8ZOjWrwhxejfzH0+4QOgzaD
 5/Dod6zdJ+P0r4pXMAYPiUYkt8cUOZ082Q2FbnP8w3l6tZAMm4yG4lH6qPIWs4a9hnz5
 b0jw==
X-Gm-Message-State: AG10YOTfq3fhEWjpIfC3DCEmPGGyoZxalmMfJ225FZ7/M1BD3U+1WE9yyzspJmM3rMBc23X8sTDM9Nmh9dDogQ==
X-Received: by 10.107.132.106 with SMTP id g103mr16342389iod.141.1454390700279; 
 Mon, 01 Feb 2016 21:25:00 -0800 (PST)
MIME-Version: 1.0
References: <1454308825-13334-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454308825-13334-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160202034239.GA2337@localhost.localdomain>
 <201602020412.u124CrgD018631@d03av03.boulder.ibm.com>
In-Reply-To: <201602020412.u124CrgD018631@d03av03.boulder.ibm.com>
From: Cyril Bur <cyrilbur@gmail.com>
Date: Tue, 02 Feb 2016 05:24:50 +0000
Message-ID: <CAN-ccARUERCigrRxOVCFBxAQAq7P-FvWZGdTJKM2ojsK=HP3EA@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid v3] Add ipmi coldReset command, which
 call a dbus method,
 belongs to NETFUN_APP. 1. A method dbus_warm_reset() to
 talk with the dbus method 'warmRest'; 2. Also get service name by
 ipmid_get_sd_bus_connection() instead of object_mapper_get_connection(); 3.
 Register the ipmi command; 4. Add related .o to the Makefile;
 5. Add wildcard function.
To: Norman James <njames@us.ibm.com>, Sam Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, William <bjlinan@cn.ibm.com>, 
 openbmc@lists.ozlabs.org
Content-Type: multipart/related; boundary=001a113ec9fe0e2c12052ac2b97c
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
X-List-Received-Date: Tue, 02 Feb 2016 05:25:03 -0000

--001a113ec9fe0e2c12052ac2b97c
Content-Type: multipart/alternative; boundary=001a113ec9fe0e2c0e052ac2b97b

--001a113ec9fe0e2c0e052ac2b97b
Content-Type: text/plain; charset=UTF-8

On Tue, 2 Feb 2016 15:13 Norman James <njames@us.ibm.com> wrote:

> Too late. Cyril had already approved this code. If you want to step up the
> priority on fixing the TODO, you could open an issue so we can make sure it
> gets addressed in a timely fashion.
>

I never 'approved' this patch. I reviewed it and pointed out that it needed
work in several places.

By the looks of things not all my concerns were addressed or explained to
me in a way that makes me feel comfortable with the patch as it is.

Furthermore even if this version had addressed all my issues with the
previous version, that does not mean I automatically approve this patch, I
still need to give my actual approval to each patch no matter what version
we get to.

You'll know when I 'approve' a patch as I will reply to it with my
"reviewed-by" tag.

Regards,
Cyril Bur
Open Source Developer


>
> Regards,
> Norman James
> IBM - POWER Systems Architect
> Phone: 1-512-286-6807 (T/L: 363-6807)
> Internet: njames@us.ibm.com
>
>
> [image: Inactive hide details for Sam Mendoza-Jonas ---02/01/2016 09:44:21
> PM---Hi William, a question below; On Mon, Feb 01, 2016 at 1]Sam
> Mendoza-Jonas ---02/01/2016 09:44:21 PM---Hi William, a question below; On
> Mon, Feb 01, 2016 at 12:40:25AM -0600, OpenBMC Patches wrote:
>
> From: Sam Mendoza-Jonas <sam@mendozajonas.com>
> To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> Cc: openbmc@lists.ozlabs.org, William <bjlinan@cn.ibm.com>
> Date: 02/01/2016 09:44 PM
> Subject: Re: [PATCH phosphor-host-ipmid v3] Add ipmi coldReset command,
> which call a dbus method, belongs to NETFUN_APP. 1. A method
> dbus_warm_reset() to talk with the dbus method 'warmRest'; 2. Also get
> service name by ipmid_get_sd_bus_connection() instead of
> object_mapper_get_connection(); 3. Register the ipmi command; 4. Add
> related .o to the Makefile; 5. Add wildcard function.
> Sent by: "openbmc" <openbmc-bounces+njames=us.ibm.com@lists.ozlabs.org>
> ------------------------------
>
>
>
>
> Hi William, a question below;
>
> On Mon, Feb 01, 2016 at 12:40:25AM -0600, OpenBMC Patches wrote:
> > From: William <bjlinan@cn.ibm.com>
> >
> > ---
> >  Makefile        |   1 +
> >  globalhandler.C | 171
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  globalhandler.h |  12 ++++
> >  3 files changed, 184 insertions(+)
> >  create mode 100644 globalhandler.C
> >  create mode 100644 globalhandler.h
> >
> > diff --git a/Makefile b/Makefile
> > index 472bfaa..58e7310 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -15,6 +15,7 @@ LIB_APP_OBJ = apphandler.o     \
> >                ipmisensor.o     \
> >                storageaddsel.o  \
> >                transporthandler.o  \
> > +              globalhandler.o
> >
> >  LIB_HOST_SRV_OBJ = host-services.o
> >
> > diff --git a/globalhandler.C b/globalhandler.C
> > new file mode 100644
> > index 0000000..e68ea79
> > --- /dev/null
> > +++ b/globalhandler.C
> > @@ -0,0 +1,171 @@
> > +#include "globalhandler.h"
> > +#include "ipmid-api.h"
> > +#include <stdio.h>
> > +#include <string.h>
> > +#include <stdint.h>
> > +
> > +const char  *control_object_name  =  "/org/openbmc/control/bmc0";
> > +const char  *control_intf_name    =  "org.openbmc.control.Bmc";
> > +
> > +const char  *objectmapper_service_name =  "org.openbmc.objectmapper";
> > +const char  *objectmapper_object_name  =
>  "/org/openbmc/objectmapper/objectmapper";
> > +const char  *objectmapper_intf_name    =
>  "org.openbmc.objectmapper.ObjectMapper";
> > +
> > +void register_netfn_global_functions() __attribute__((constructor));
> > +
> > +int obj_mapper_get_connection(char** buf, const char* obj_path)
> > +{
> > +    sd_bus_error error = SD_BUS_ERROR_NULL;
> > +    sd_bus_message *m = NULL;
> > +    sd_bus *bus = NULL;
> > +    char *temp_buf = NULL, *intf = NULL;
> > +    size_t buf_size = 0;
> > +    int r;
> > +
> > +    //Get the system bus where most system services are provided.
> > +    bus = ipmid_get_sd_bus_connection();
> > +
> > +    /*
> > +     * Bus, service, object path, interface and method are provided to
> call
> > +     * the method.
> > +     * Signatures and input arguments are provided by the arguments at
> the
> > +     * end.
> > +     */
> > +    r = sd_bus_call_method(bus,
> > +            objectmapper_service_name,                      /* service
> to contact */
> > +            objectmapper_object_name,                       /* object
> path */
> > +            objectmapper_intf_name,                         /*
> interface name */
> > +            "GetObject",                                    /* method
> name */
> > +            &error,                                         /* object
> to return error in */
> > +            &m,                                             /* return
> message on success */
> > +            "s",                                            /* input
> signature */
> > +            obj_path                                        /* first
> argument */
> > +            );
> > +
> > +    if (r < 0) {
> > +        fprintf(stderr, "Failed to issue method call: %s\n",
> error.message);
> > +        goto finish;
> > +    }
> > +
> > +    // Get the key, aka, the connection name
> > +    sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
> > +
> > + /*
> > +     * TODO: check the return code. Currently for no reason the message
> > +     * parsing of object mapper is always complaining about
> > +     * "Device or resource busy", but the result seems OK for now. Need
> > +     *  further checks.
> > +     */
>
> I've seen this comment before and it worries me a bit. Why are we
> getting the error? How do you know temp_buf is allocated properly? What
> does it mean that the result "seems OK"?
> You check return codes before and after this, but if you get unlucky
> here you could easily segfault or read nonsense.
>
> I think this issue should be figured out before merging the code, both
> here and wherever else it appears.
>
> Thanks,
> Sam
>
> > +
> > +    buf_size = strlen(temp_buf) + 1;
> > +    printf("IPMID connection name: %s\n", temp_buf);
> > +    *buf = (char*)malloc(buf_size);
> > +
> > +    if (*buf == NULL) {
> > +        fprintf(stderr, "Malloc failed for warm reset");
> > +        r = -1;
> > +        goto finish;
> > +    }
> > +
> > +    memcpy(*buf, temp_buf, buf_size);
> > +
> > +finish:
> > +    sd_bus_error_free(&error);
> > +    sd_bus_message_unref(m);
> > +
> > +    return r;
> > +}
> > +
> > +int dbus_warm_reset()
> > +{
> > +    sd_bus_error error = SD_BUS_ERROR_NULL;
> > +    sd_bus_message *m = NULL;
> > +    sd_bus *bus = NULL;
> > +    char* temp_buf = NULL;
> > +    uint8_t* get_value = NULL;
> > +    char* connection = NULL;
> > +    int r, i;
> > +
> > +    r = obj_mapper_get_connection(&connection, control_object_name);
> > +    if (r < 0) {
> > +        fprintf(stderr, "Failed to get connection, return value:
> %d.\n", r);
> > +        goto finish;
> > +    }
> > +
> > +    printf("connection: %s\n", connection);
> > +
> > +    // Open the system bus where most system services are provided.
> > +    bus = ipmid_get_sd_bus_connection();
> > +
> > +    /*
> > +     * Bus, service, object path, interface and method are provided to
> call
> > +     * the method.
> > +     * Signatures and input arguments are provided by the arguments at
> the
> > +     * end.
> > +  */
> > +    r = sd_bus_call_method(bus,
> > +            connection,                                /* service to
> contact */
> > +            control_object_name,                       /* object path */
> > +            control_intf_name,                         /* interface
> name */
> > +            "warmReset",                               /* method name */
> > +            &error,                                    /* object to
> return error in */
> > +            &m,                                        /* return
> message on success */
> > +            NULL,
> > +            NULL
> > +            );
> > +
> > +    if (r < 0) {
> > +        fprintf(stderr, "Failed to issue method call: %s\n",
> error.message);
> > +        goto finish;
> > +    }
> > +
> > +finish:
> > +    sd_bus_error_free(&error);
> > +    sd_bus_message_unref(m);
> > +    free(connection);
> > +
> > +    return r;
> > +}
> > +
> > +ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> > +                              ipmi_request_t request, ipmi_response_t
> response,
> > +                              ipmi_data_len_t data_len, ipmi_context_t
> context)
> > +{
> > +    printf("Handling GLOBAL warmReset Netfn:[0x%X],
> Cmd:[0x%X]\n",netfn, cmd);
> > +
> > +    // TODO: call the correct dbus method for warmReset.
> > +    dbus_warm_reset();
> > +
> > +    // Status code.
> > +    ipmi_ret_t rc = IPMI_CC_OK;
> > +    *data_len = 0;
> > +    return rc;
> > +}
> > +
> > +ipmi_ret_t ipmi_global_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t
> cmd,
> > +                              ipmi_request_t request, ipmi_response_t
> response,
> > +                              ipmi_data_len_t data_len, ipmi_context_t
> context)
> > +{
> > +    printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
> > +
> > +    // Status code.
> > +    ipmi_ret_t rc = IPMI_CC_OK;
> > +
> > +    *data_len = strlen("THIS IS WILDCARD");
> > +
> > +    // Now pack actual response
> > +    memcpy(response, "THIS IS WILDCARD", *data_len);
> > +
> > +    return rc;
> > +}
> > +
> > +void register_netfn_global_functions()
> > +{
> > +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP,
> IPMI_CMD_WARM_RESET);
> > +    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WARM_RESET, NULL,
> ipmi_global_warm_reset);
> > +
> > +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP,
> IPMI_CMD_WILDCARD);
> > +    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL,
> ipmi_global_wildcard_handler);
> > +
> > + return;
> > +}
> > diff --git a/globalhandler.h b/globalhandler.h
> > new file mode 100644
> > index 0000000..608df3b
> > --- /dev/null
> > +++ b/globalhandler.h
> > @@ -0,0 +1,12 @@
> > +#ifndef __HOST_IPMI_GLOBAL_HANDLER_H__
> > +#define __HOST_IPMI_GLOBAL_HANDLER_H__
> > +
> > +#include <stdint.h>
> > +
> > +// Various GLOBAL operations under a single command.
> > +enum ipmi_global_control_cmds : uint8_t
> > +{
> > +IPMI_CMD_WARM_RESET    = 0x02,
> > +};
> > +
> > +#endif
> > --
> > 2.6.4
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--001a113ec9fe0e2c0e052ac2b97b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 2 Feb 2016 15:1=
3=C2=A0Norman James &lt;<a href=3D"mailto:njames@us.ibm.com">njames@us.ibm.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" id=3D"gmail_bloc=
k_quote0"><div><p>Too late.  Cyril had already approved this code.   If you=
 want to step up the priority on fixing the TODO, you could open an issue s=
o we can make sure it gets addressed in a timely fashion.  <br></p></div></=
blockquote></div><div><br></div><div>I never &#39;approved&#39; this patch.=
 I reviewed it and pointed out that it needed work in several places.</div>=
<div><br></div><div>By the looks of things not all my concerns were address=
ed or explained to me in a way that makes me feel comfortable with the patc=
h as it is.</div><div><br></div><div>Furthermore even if this version had a=
ddressed all my issues with the previous version, that does not mean I auto=
matically approve this patch, I still need to give my actual approval to ea=
ch patch no matter what version we get to.</div><div><br></div><div>You&#39=
;ll know when I &#39;approve&#39; a patch as I will reply to it with my &qu=
ot;reviewed-by&quot; tag.</div><div><br></div><div>Regards,</div><div>Cyril=
 Bur</div><div>Open Source Developer</div><div><br></div><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex" id=3D"gmail_block_quote1"><div><p><=
br><br>Regards,<br>Norman James<br>IBM - POWER Systems Architect<br>Phone: =
1-512-286-6807 (T/L: 363-6807)<br>Internet: <a href=3D"mailto:njames@us.ibm=
.com" target=3D"_blank">njames@us.ibm.com</a><br><br><br><img width=3D"16" =
height=3D"16" src=3D"cid:152a0616502308fca931" border=3D"0" alt=3D"Inactive=
 hide details for Sam Mendoza-Jonas ---02/01/2016 09:44:21 PM---Hi William,=
 a question below; On Mon, Feb 01, 2016 at 1" id=3D"i152a0616502308fca931" =
class=3D"nativeView" style=3D"width: 288px;"><font color=3D"#424282">Sam Me=
ndoza-Jonas ---02/01/2016 09:44:21 PM---Hi William, a question below; On Mo=
n, Feb 01, 2016 at 12:40:25AM -0600, OpenBMC Patches wrote:</font><br><br><=
font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">Sam =
Mendoza-Jonas &lt;<a href=3D"mailto:sam@mendozajonas.com" target=3D"_blank"=
>sam@mendozajonas.com</a>&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">=
To:        </font><font size=3D"2">OpenBMC Patches &lt;<a href=3D"mailto:op=
enbmc-patches@stwcx.xyz" target=3D"_blank">openbmc-patches@stwcx.xyz</a>&gt=
;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=
=3D"2"><a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbm=
c@lists.ozlabs.org</a>, William &lt;<a href=3D"mailto:bjlinan@cn.ibm.com" t=
arget=3D"_blank">bjlinan@cn.ibm.com</a>&gt;</font><br><font size=3D"2" colo=
r=3D"#5F5F5F">Date:        </font><font size=3D"2">02/01/2016 09:44 PM</fon=
t><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=
=3D"2">Re: [PATCH phosphor-host-ipmid v3] Add ipmi coldReset command, which=
 call a dbus method, belongs to NETFUN_APP. 1. A method dbus_warm_reset() t=
o talk with the dbus method &#39;warmRest&#39;; 2. Also get service name by=
 ipmid_get_sd_bus_connection() instead of object_mapper_get_connection(); 3=
. Register the ipmi command; 4. Add related .o to the Makefile; 5. Add wild=
card function.</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:       =
 </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=3D<=
a href=3D"mailto:us.ibm.com@lists.ozlabs.org" target=3D"_blank">us.ibm.com@=
lists.ozlabs.org</a>&gt;</font><br></p><hr width=3D"100%" size=3D"2" align=
=3D"left" noshade style=3D"color:#8091a5"><p></p></div><div><p><br><br><br>=
<tt>Hi William, a question below;<br><br>On Mon, Feb 01, 2016 at 12:40:25AM=
 -0600, OpenBMC Patches wrote:<br>&gt; From: William &lt;<a href=3D"mailto:=
bjlinan@cn.ibm.com" target=3D"_blank">bjlinan@cn.ibm.com</a>&gt;<br>&gt; <b=
r>&gt; ---<br>&gt; =C2=A0Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<b=
r>&gt; =C2=A0globalhandler.C | 171 ++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++<br>&gt; =C2=A0globalhandler.h | =C2=A012 ++++<br>&gt; =C2=
=A03 files changed, 184 insertions(+)<br>&gt; =C2=A0create mode 100644 glob=
alhandler.C<br>&gt; =C2=A0create mode 100644 globalhandler.h<br>&gt; <br>&g=
t; diff --git a/Makefile b/Makefile<br>&gt; index 472bfaa..58e7310 100644<b=
r>&gt; --- a/Makefile<br>&gt; +++ b/Makefile<br>&gt; @@ -15,6 +15,7 @@ LIB_=
APP_OBJ =3D apphandler.o =C2=A0 =C2=A0 \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipmisensor.o =C2=A0 =C2=A0 \<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0storageaddsel.o =C2=A0\<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0transporthandle=
r.o =C2=A0\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0globa=
lhandler.o =C2=A0<br>&gt; =C2=A0<br>&gt; =C2=A0LIB_HOST_SRV_OBJ =3D host-se=
rvices.o<br>&gt; =C2=A0<br>&gt; diff --git a/globalhandler.C b/globalhandle=
r.C<br>&gt; new file mode 100644<br>&gt; index 0000000..e68ea79<br>&gt; ---=
 /dev/null<br>&gt; +++ b/globalhandler.C<br>&gt; @@ -0,0 +1,171 @@<br>&gt; =
+#include &quot;globalhandler.h&quot;<br>&gt; +#include &quot;ipmid-api.h&q=
uot;<br>&gt; +#include &lt;stdio.h&gt;<br>&gt; +#include &lt;string.h&gt;<b=
r>&gt; +#include &lt;stdint.h&gt;<br>&gt; +<br>&gt; +const char =C2=A0*cont=
rol_object_name =C2=A0=3D =C2=A0&quot;/org/openbmc/control/bmc0&quot;;<br>&=
gt; +const char =C2=A0*control_intf_name =C2=A0 =C2=A0=3D =C2=A0&quot;org.o=
penbmc.control.Bmc&quot;;<br>&gt; +<br>&gt; +const char =C2=A0*objectmapper=
_service_name =3D =C2=A0&quot;org.openbmc.objectmapper&quot;;<br>&gt; +cons=
t char =C2=A0*objectmapper_object_name =C2=A0=3D =C2=A0&quot;/org/openbmc/o=
bjectmapper/objectmapper&quot;;<br>&gt; +const char =C2=A0*objectmapper_int=
f_name =C2=A0 =C2=A0=3D =C2=A0&quot;org.openbmc.objectmapper.ObjectMapper&q=
uot;;<br>&gt; +<br>&gt; +void register_netfn_global_functions() __attribute=
__((constructor));<br>&gt; +<br>&gt; +int obj_mapper_get_connection(char** =
buf, const char* obj_path)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0sd_bus_error e=
rror =3D SD_BUS_ERROR_NULL;<br>&gt; + =C2=A0 =C2=A0sd_bus_message *m =3D NU=
LL;<br>&gt; + =C2=A0 =C2=A0sd_bus *bus =3D NULL;<br>&gt; + =C2=A0 =C2=A0cha=
r *temp_buf =3D NULL, *intf =3D NULL;<br>&gt; + =C2=A0 =C2=A0size_t buf_siz=
e =3D 0;<br>&gt; + =C2=A0 =C2=A0int r;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0//G=
et the system bus where most system services are provided.<br>&gt; + =C2=A0=
 =C2=A0bus =3D ipmid_get_sd_bus_connection();<br>&gt; +<br>&gt; + =C2=A0 =
=C2=A0/*<br>&gt; + =C2=A0 =C2=A0 * Bus, service, object path, interface and=
 method are provided to call<br>&gt; + =C2=A0 =C2=A0 * the method.<br>&gt; =
+ =C2=A0 =C2=A0 * Signatures and input arguments are provided by the argume=
nts at the<br>&gt; + =C2=A0 =C2=A0 * end.<br>&gt; + =C2=A0 =C2=A0 */<br>&gt=
; + =C2=A0 =C2=A0r =3D sd_bus_call_method(bus,<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0objectmapper_service_name, =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* service to contact *=
/<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objectmapper_object_na=
me, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* object path */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0objectmapper_intf_name, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* interface name */<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;GetObject&quot;, =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* method name */<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* object to return error in */<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;m, =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* return message o=
n success */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;s&quo=
t;, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* input signature */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0obj_path =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* first argument */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0if (r &lt; 0) {<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Failed to issue method call: %s\=
n&quot;, error.message);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0goto finish;<=
br>&gt; + =C2=A0 =C2=A0}<br>&gt; +<br>&gt; + =C2=A0 =C2=A0// Get the key, a=
ka, the connection name<br>&gt; + =C2=A0 =C2=A0sd_bus_message_read(m, &quot=
;a{sas}&quot;, 1, &amp;temp_buf, 1, &amp;intf);<br>&gt; + =C2=A0 =C2=A0<br>=
&gt; +                 /* <br>&gt; + =C2=A0 =C2=A0 * TODO: check the return=
 code. Currently for no reason the message<br>&gt; + =C2=A0 =C2=A0 * parsin=
g of object mapper is always complaining about<br>&gt; + =C2=A0 =C2=A0 * &q=
uot;Device or resource busy&quot;, but the result seems OK for now. Need<br=
>&gt; + =C2=A0 =C2=A0 * =C2=A0further checks.<br>&gt; + =C2=A0 =C2=A0 */<br=
><br>I&#39;ve seen this comment before and it worries me a bit. Why are we<=
br>getting the error? How do you know temp_buf is allocated properly? What<=
br>does it mean that the result &quot;seems OK&quot;?<br>You check return c=
odes before and after this, but if you get unlucky<br>here you could easily=
 segfault or read nonsense.<br><br>I think this issue should be figured out=
 before merging the code, both<br>here and wherever else it appears.<br><br=
>Thanks,<br>Sam<br><br>&gt; +<br>&gt; + =C2=A0 =C2=A0buf_size =3D strlen(te=
mp_buf) + 1;<br>&gt; + =C2=A0 =C2=A0printf(&quot;IPMID connection name: %s\=
n&quot;, temp_buf);<br>&gt; + =C2=A0 =C2=A0*buf =3D (char*)malloc(buf_size)=
;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0if (*buf =3D=3D NULL) {<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Malloc failed for warm reset&quo=
t;);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D -1;<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto finish;<br>&gt; + =C2=A0 =C2=A0}<br>&gt; +<br>&gt; + =C2=
=A0 =C2=A0memcpy(*buf, temp_buf, buf_size);<br>&gt; +<br>&gt; +finish:<br>&=
gt; + =C2=A0 =C2=A0sd_bus_error_free(&amp;error);<br>&gt; + =C2=A0 =C2=A0sd=
_bus_message_unref(m);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0return r;<br>&gt; +=
}<br>&gt; +<br>&gt; +int dbus_warm_reset()<br>&gt; +{<br>&gt; + =C2=A0 =C2=
=A0sd_bus_error error =3D SD_BUS_ERROR_NULL;<br>&gt; + =C2=A0 =C2=A0sd_bus_=
message *m =3D NULL;<br>&gt; + =C2=A0 =C2=A0sd_bus *bus =3D NULL;<br>&gt; +=
 =C2=A0 =C2=A0char* temp_buf =3D NULL;<br>&gt; + =C2=A0 =C2=A0uint8_t* get_=
value =3D NULL;<br>&gt; + =C2=A0 =C2=A0char* connection =3D NULL;<br>&gt; +=
 =C2=A0 =C2=A0int r, i;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0r =3D obj_mapper_g=
et_connection(&amp;connection, control_object_name);<br>&gt; + =C2=A0 =C2=
=A0if (r &lt; 0) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &qu=
ot;Failed to get connection, return value: %d.\n&quot;, r);<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0goto finish;<br>&gt; + =C2=A0 =C2=A0}<br>&gt; +<br>=
&gt; + =C2=A0 =C2=A0printf(&quot;connection: %s\n&quot;, connection);<br>&g=
t; +<br>&gt; + =C2=A0 =C2=A0// Open the system bus where most system servic=
es are provided.<br>&gt; + =C2=A0 =C2=A0bus =3D ipmid_get_sd_bus_connection=
();<br>&gt; + =C2=A0 =C2=A0<br>&gt; + =C2=A0 =C2=A0/*<br>&gt; + =C2=A0 =C2=
=A0 * Bus, service, object path, interface and method are provided to call<=
br>&gt; + =C2=A0 =C2=A0 * the method.<br>&gt; + =C2=A0 =C2=A0 * Signatures =
and input arguments are provided by the arguments at the<br>&gt; + =C2=A0 =
=C2=A0 * end.<br>&gt; +                 =C2=A0*/<br>&gt; + =C2=A0 =C2=A0r =
=3D sd_bus_call_method(bus,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0connection, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* service to contac=
t */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0control_object_name=
, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* object path */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
ntrol_intf_name, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* interface name */<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;warmReset&quot;, =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* method name */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;error, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* object=
 to return error in */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
amp;m, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 return message on success */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0NULL,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>&gt; +<br>&gt; + =C2=A0 =
=C2=A0if (r &lt; 0) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, =
&quot;Failed to issue method call: %s\n&quot;, error.message);<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0goto finish;<br>&gt; + =C2=A0 =C2=A0}<br>&gt; +<=
br>&gt; +finish:<br>&gt; + =C2=A0 =C2=A0sd_bus_error_free(&amp;error);<br>&=
gt; + =C2=A0 =C2=A0sd_bus_message_unref(m);<br>&gt; + =C2=A0 =C2=A0free(con=
nection);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0return r;<br>&gt; +}<br>&gt; +<b=
r>&gt; +ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cm=
d,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipmi_request_t request, ipmi_resp=
onse_t response,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipmi_data_len_t dat=
a_len, ipmi_context_t context)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0printf(&qu=
ot;Handling GLOBAL warmReset Netfn:[0x%X], Cmd:[0x%X]\n&quot;,netfn, cmd);<=
br>&gt; +<br>&gt; + =C2=A0 =C2=A0// TODO: call the correct dbus method for =
warmReset.<br>&gt; + =C2=A0 =C2=A0dbus_warm_reset();<br>&gt; +<br>&gt; + =
=C2=A0 =C2=A0// Status code.<br>&gt; + =C2=A0 =C2=A0ipmi_ret_t rc =3D IPMI_=
CC_OK;<br>&gt; + =C2=A0 =C2=A0*data_len =3D 0;<br>&gt; + =C2=A0 =C2=A0retur=
n rc;<br>&gt; +}<br>&gt; +<br>&gt; +ipmi_ret_t ipmi_global_wildcard_handler=
(ipmi_netfn_t netfn, ipmi_cmd_t cmd,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ipmi_request_t request, ipmi_response_t response,<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ipmi_data_len_t data_len, ipmi_context_t context)<br>&g=
t; +{<br>&gt; + =C2=A0 =C2=A0printf(&quot;Handling WILDCARD Netfn:[0x%X], C=
md:[0x%X]\n&quot;,netfn, cmd);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0// Status c=
ode.<br>&gt; + =C2=A0 =C2=A0ipmi_ret_t rc =3D IPMI_CC_OK;<br>&gt; +<br>&gt;=
 + =C2=A0 =C2=A0*data_len =3D strlen(&quot;THIS IS WILDCARD&quot;);<br>&gt;=
 +<br>&gt; + =C2=A0 =C2=A0// Now pack actual response<br>&gt; + =C2=A0 =C2=
=A0memcpy(response, &quot;THIS IS WILDCARD&quot;, *data_len);<br>&gt; +<br>=
&gt; + =C2=A0 =C2=A0return rc;<br>&gt; +}<br>&gt; +<br>&gt; +void register_=
netfn_global_functions()<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0printf(&quot;Reg=
istering NetFn:[0x%X], Cmd:[0x%X]\n&quot;,NETFUN_APP, IPMI_CMD_WARM_RESET);=
<br>&gt; + =C2=A0 =C2=A0ipmi_register_callback(NETFUN_APP, IPMI_CMD_WARM_RE=
SET, NULL, ipmi_global_warm_reset);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0printf=
(&quot;Registering NetFn:[0x%X], Cmd:[0x%X]\n&quot;,NETFUN_APP, IPMI_CMD_WI=
LDCARD);<br>&gt; + =C2=A0 =C2=A0ipmi_register_callback(NETFUN_APP, IPMI_CMD=
_WILDCARD, NULL, ipmi_global_wildcard_handler);<br>&gt; +<br>&gt; +        =
         return;<br>&gt; +}<br>&gt; diff --git a/globalhandler.h b/globalha=
ndler.h<br>&gt; new file mode 100644<br>&gt; index 0000000..608df3b<br>&gt;=
 --- /dev/null<br>&gt; +++ b/globalhandler.h<br>&gt; @@ -0,0 +1,12 @@<br>&g=
t; +#ifndef __HOST_IPMI_GLOBAL_HANDLER_H__<br>&gt; +#define __HOST_IPMI_GLO=
BAL_HANDLER_H__<br>&gt; +<br>&gt; +#include &lt;stdint.h&gt;<br>&gt; +<br>&=
gt; +// Various GLOBAL operations under a single command.<br>&gt; +enum ipm=
i_global_control_cmds : uint8_t<br>&gt; +{<br>&gt; +IPMI_CMD_WARM_RESET    =
                                                =C2=A0 =C2=A0=3D 0x02,<br>&=
gt; +};<br>&gt; +<br>&gt; +#endif<br>&gt; -- <br>&gt; 2.6.4<br>&gt; <br>&gt=
; <br>&gt; _______________________________________________<br>&gt; openbmc =
mailing list<br>&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"=
_blank">openbmc@lists.ozlabs.org</a><br>&gt; </tt><tt><a href=3D"https://li=
sts.ozlabs.org/listinfo/openbmc" target=3D"_blank">https://lists.ozlabs.org=
/listinfo/openbmc</a></tt><tt><br><br>_____________________________________=
__________<br>openbmc mailing list<br><a href=3D"mailto:openbmc@lists.ozlab=
s.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br></tt><tt><a href=
=3D"https://lists.ozlabs.org/listinfo/openbmc" target=3D"_blank">https://li=
sts.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><br>
</p></div>
_______________________________________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
</blockquote></div>

--001a113ec9fe0e2c0e052ac2b97b--

--001a113ec9fe0e2c12052ac2b97c
Content-Type: image/gif; name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-Transfer-Encoding: base64
Content-ID: <152a0616502308fca931>
X-Attachment-Id: 152a0616502308fca931

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--001a113ec9fe0e2c12052ac2b97c--
