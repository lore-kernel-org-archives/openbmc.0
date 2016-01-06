Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x233.google.com (mail-pa0-x233.google.com
 [IPv6:2607:f8b0:400e:c03::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1ED601A1176
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2016 17:57:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Mk/TneVJ; 
 dkim-atps=neutral
Received: by mail-pa0-x233.google.com with SMTP id do7so679732pab.2
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2016 22:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=2ZMJvXI9T2aBBbV6073cFchu2KoYGEke7lbh4gdheqM=;
 b=Mk/TneVJ/ah2R1A32XZ5pgdOOrD6AXCZyVUQ5pL8HWAEq3hOBuSP/FFyHnCUcL5/Ev
 O6oy+zWzXsh7QBbx4AomLvLU0kRAkigKo6GH0jOA+KnmOJD1hsCD+2EuJ8F6gDGrqYqU
 h2+Kk/izU7vBF06RYIzZGMAzskay35kM0F2P/AvdEvxVFmYecAzj8NrFjWEb3hHIQNPY
 pheXj3vi7mfDBj3msH7Si/xbElucgSfKfKV0qLosr0NhMJBFoWeSp+3xU/thG2fG4zdz
 s2FpUwdb0CSQJKA/xkU53tu7QjDWt/eaE8N0TeCrJlkeJM6W5EIe7Irkz3a2IouBVG9Z
 F6sg==
X-Received: by 10.66.237.102 with SMTP id vb6mr139085755pac.133.1452063430702; 
 Tue, 05 Jan 2016 22:57:10 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id sy5sm137907179pac.5.2016.01.05.22.57.08
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 05 Jan 2016 22:57:10 -0800 (PST)
Date: Wed, 6 Jan 2016 17:57:01 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
Cc: openbmc@lists.ozlabs.org, openbmc-patches@stwcx.xyz
Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipmid
 command support with correct DBUS property handling.
Message-ID: <20160106175701.196f6a77@camb691>
In-Reply-To: <201601060613.u066Dbgg023586@d23av03.au.ibm.com>
References: <20160106160934.493e446f@camb691>
 <1451956226-19954-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1451956226-19954-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201601060613.u066Dbgg023586@d23av03.au.ibm.com>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 06 Jan 2016 06:57:14 -0000

On Wed, 6 Jan 2016 06:13:06 +0000
"Peng Fei BG Gou" <shgoupf@cn.ibm.com> wrote:

> Hey Cyril,
> =20
> Thanks for your detailed review on this patch.
> =20

Hi Peng,

> Just want to answer (most of) your questions in batch:
> 1) This patch intended to add the functionality of ipmi set/get boot opti=
on, with dbus property and object mapper used, so I believe all of the cont=
ents in this patch should be considered as a whole. We shouldn't split them=
 into multiple patches.

The set/get boot option is fine as one patch (or two... not too fussed real=
ly) I
agree.

You do still have whitespace (and other) changes which touch code not relat=
ed
to the boot option work, notably in ipmi_chassis_power_control() and
ipmi_chassis_control()

> 2) atoi is an alternative, but I don't see there is any reason why to use=
 it since sscanf/sprintf works fine for now. I don't believe there is too m=
uch performance concern there.=20

I'm not saying sscanf won't work, I completely agree that it will. I do
disagree that there isn't a performance concern, if I'm not mistaken this c=
ode
will be running on an ASPEED2400 which is a single core ARM chip running at
400MHz. We have breathing space and we don't need to write absolutely
everything to save all the possible cycles but lets not waste the little
breathing space we do have.

> 3) For those sd_bus method call with signatures ("s", "v", "s{ass}", etc.=
), I believe the current way I use it is valid since I have tested them alr=
eady.

Again, I'm not saying it won't work but I'm trying to understand why the
complexity in these signatures, it doesn't seem like it's being used and
pointless complexity doesn't help anyone.

However, if there is a good reason for these complicated signatures I'm all=
 for
it, if you could document them in
https://github.com/openbmc/docs/blob/master/dbus-interfaces.md that would be
fantastic.

Thanks.

> 4) For the commented out error handling, I believe it's just a work aroun=
d, but it did works according to my test. So I believe it's OK for this pat=
ch to have it and we should revisit it later.
> 5) For the way how return code is handled, I believe it is working fine.
> 6) For the coding style stuff, such as spaces between function names and =
the bracket, I don't think it's a major issue. Maybe it's a minor issue tha=
t they are not consistent with some piece of code elsewhere. It can be fixe=
d with my auto style tool very easily.=20
> =20

It isn't a major issue at all but this project already has enough code style
issues as it is, I don't see why patches should be merged that introduce mo=
re
style problems.

Perhaps you should run your auto style tool on your patch(es) before submis=
sion?

> In a sum, thanks for your effort on reviewing this, but I believe most of=
 your current concerns either are invalid or are only minor issues.
> =20
> GOU, Peng Fei (=E8=8B=9F=E9=B9=8F=E9=A3=9E), Ph.D.
> OpenPower Team.
> +86-21-609-28631
> =20
> =20
> ----- Original message -----
> From: Cyril Bur <cyrilbur@gmail.com>
> To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, Peng Fei BG Gou/China/IB=
M@IBMCN
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipmid=
 command support with correct DBUS property handling.
> Date: Wed, Jan 6, 2016 1:10 PM
> =20
> On Mon,  4 Jan 2016 19:10:26 -0600
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
>=20
> > From: shgoupf <shgoupf@cn.ibm.com>
> >
>=20
> Hi again,
>=20
> > 1) Add support for IPMI get/set boot option command.
> >     a) boot options stored in dbus property.
> >     b) IPMI get boot option command get boot option from the dbus
> >     property.
> >     c) IPMI set boot option coomand set boot option to the dbus
> >     property.
> > 2) Two methods to handle the dbus property set and get:
> >     a) dbus_set_property()
> >     b) dbus_get_property()
> > 3) The property is stored as a 10 character strings which representsd 5=
-byte information.
> > 4) ipmid set method is registered and implemented since petitboot will =
use it to clear the boot options.
> > 5) Get service name via object mapper
> >     a) The connection name is got via objectmapper.
> >     b) The method used to get the connection name is object_mapper_get_=
connection().
> >     c) dbus_get_property/dbus_set_property will get the connection name=
 via the above method instead of hard coding.
> > 6) Error code are properly handled.
> > 7) Use sprinf/sscanf for int/string conversion.
> >     a) Instead of reinventing the wheel by defining methods converting =
int to string, use sprintf/sscanf should be a more clean and robust way.
>=20
> Plus 1 for not reinventing the wheel but perhaps consider using the best =
tool
> for the job, sscanf can and does do what you want however atoi, atol, ato=
ll,
> strtol, strtoll, strtoq functions are all designed for this exact purpose=
. They
> will perform much better than sscanf, also the str* versions give great c=
ontrol
> and error detection capabilities.
>=20
>=20
> > 8) Fix issues addressed by the community.
> >     a) change malloc heap to stack local variable.
> >     b) Fix multi line comment style from "//" to "/**/".
> >     c) Add defines for return codes.
> >     d) Add more comments.
>=20
> It looks like you're adding more and more into this same patch. A single =
patch
> should be one clearly defined piece of work. So you're implementing some =
new
> functionality, that should be its own patch. You're also adding some error
> handling paths - also, its own patch. You've changed some whitespace (som=
e of
> which was a bad thing) but the good whitespace changes should also be the=
ir own
> patch.
>=20
> >  chassishandler.C | 492 +++++++++++++++++++++++++++++++++++++++++++++--=
--------
> >  chassishandler.h |  18 ++
> >  2 files changed, 423 insertions(+), 87 deletions(-)
> >
> > diff --git a/chassishandler.C b/chassishandler.C
> > index 1389db9..4d941e8 100644
> > --- a/chassishandler.C
> > +++ b/chassishandler.C
> > @@ -5,11 +5,235 @@
> >  #include <stdint.h>
> > =20
> >  // OpenBMC Chassis Manager dbus framework
> > -const char  *chassis_bus_name      =3D  "org.openbmc.control.Chassis";
> > -const char  *chassis_object_name   =3D  "/org/openbmc/control/chassis0=
";
> > -const char  *chassis_intf_name     =3D  "org.openbmc.control.Chassis";
> > +const char * chassis_bus_name      =3D  "org.openbmc.control.Chassis";
> > +const char * chassis_object_name   =3D  "/org/openbmc/control/chassis0=
";
> > +const char * chassis_intf_name     =3D  "org.openbmc.control.Chassis";
> > =20
>=20
> Not necessary, if anything you should remove the double space but what yo=
u've
> done doesn't look good.
>=20
> > -void register_netfn_chassis_functions() __attribute__((constructor));
> > +// Host settings in dbus
> > +// Service name should be referenced by connection name got via object=
 mapper
> > +const char * settings_object_name  =3D  "/org/openbmc/settings/host0";
> > +const char * settings_intf_name    =3D  "org.freedesktop.DBus.Properti=
es";
> > +
> > +const char * objmapper_service_name =3D  "org.openbmc.objectmapper";
> > +const char * objmapper_object_name  =3D  "/org/openbmc/objectmapper/ob=
jectmapper";
> > +const char * objmapper_intf_name    =3D  "org.openbmc.objectmapper.Obj=
ectMapper";
> > +
>=20
> We probably want to try to keep a consistent style. I looked at ipmid.C a=
nd
> that file isn't consistent but it seems to be mostly "type *name;" and th=
at's
> the most common way everywhere else with C code.
>=20
> > +int object_mapper_get_connection (char ** buf, const char * obj_path)
> > +{
> > +    sd_bus_error error =3D SD_BUS_ERROR_NULL;
> > +    sd_bus_message * m =3D NULL;
> > +    sd_bus * bus =3D NULL;
> > +    char * temp_buf =3D NULL, *intf =3D NULL;
> > +    size_t buf_size =3D 0;
> > +    int r;
> > +
> > +    // Open the system bus where most system services are provided.
> > +    r =3D sd_bus_open_system (&bus);
> > +
>=20
> As an added stylistic note, again for consistency, ipmid.C, you should av=
oid
> having a space between the function name and the parameters
>=20
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to connect to system bus: %s\n", stre=
rror (-r));
> > +        goto finish;
> > +    }
> > +
> > +    /*
> > +     * Bus, service, object path, interface and method are provided to=
 call
> > +     * the method.
> > +     * Signatures and input arguments are provided by the arguments at=
 the
> > +     * end.
> > +     */
> > +    r =3D sd_bus_call_method (bus,
> > +                            objmapper_service_name,                   =
   /* service to contact */
> > +                            objmapper_object_name,                    =
   /* object path */
> > +                            objmapper_intf_name,                      =
   /* interface name */
> > +                            "GetObject",                              =
   /* method name */
> > +                            &error,                                   =
   /* object to return error in */
> > +                            &m,                                       =
   /* return message on success */
> > +                            "s",                                      =
   /* input signature */
> > +                            obj_path                                  =
   /* first argument */
> > +                           );
> > +
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to issue method call: %s\n", error.me=
ssage);
> > +        goto finish;
> > +    }
> > +
> > +    // Get the key, aka, the connection name
> > +    sd_bus_message_read (m, "a{sas}", 1, &temp_buf, 1, &intf);
> > +
>=20
> This seems very roundabout, could you explain this method call. What are =
you
> expecting to receive? From the looks of what you're using it for wouldn't=
 it
> make more sense to just sd_bus_message_read a "s"?
>=20
> > +    /*
> > +     * TODO: check the return code. Currently for no reason the message
> > +     * parsing of object mapper is always complaining about
> > +     * "Device or resource busy", but the result seems OK for now. Need
> > +     * further checks.
>=20
> If sd_bus_message_read returns a negative value, something definitely went
> wrong, I highly highly doubt you can use the result if it turns a negativ=
e.
>=20
> > +     * TODO: The following code is preserved in the comments so that i=
t can be
> > +     * resumed after the problem aforementioned is resolved.
> > +     *r =3D sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
> > +     *if (r < 0) {
> > +     *    fprintf(stderr, "Failed to parse response message: %s\n", st=
rerror(-r));
> > +     *    goto finish;
> > +     *}
>=20
> The code is in git, it is saved there, delete it now and when someone wan=
ts to
> add it back they can look in the git history for what was deleted. Having=
 said
> that, the error check should be there, if you're hitting it, you should f=
igure
> out why.
>=20
> > +     */
> > +
> > +    buf_size =3D strlen (temp_buf) + 1;
> > +    printf ("IPMID connection name: %s\n", temp_buf);
> > +    *buf =3D (char *)malloc (buf_size);
> > +
> > +    if (*buf =3D=3D NULL) {
> > +        fprintf (stderr, "Malloc failed for get_sys_boot_options");
> > +        r =3D -1;
> > +        goto finish;
> > +    }
> > +
>=20
> I don't mind using malloc but these are strings no? Couldn't strndup be u=
sed,
> might make life easier? Not a big concern.
>=20
> > +    memcpy (*buf, temp_buf, buf_size);
> > +
> > +finish:
> > +    sd_bus_error_free (&error);
> > +    sd_bus_message_unref (m);
> > +    sd_bus_unref (bus);
> > +
>=20
> Spaces between name and params
>=20
> > +    return r;
> > +}
> > +
> > +int dbus_get_property (char * buf)
> > +{
> > +    sd_bus_error error =3D SD_BUS_ERROR_NULL;
> > +    sd_bus_message * m =3D NULL;
> > +    sd_bus * bus =3D NULL;
> > +    char * temp_buf =3D NULL;
> > +    uint8_t * get_value =3D NULL;
> > +    char * connection =3D NULL;
> > +    int r, i;
> > +
> > +    r =3D object_mapper_get_connection (&connection, settings_object_n=
ame);
> > +
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to get connection, return value: %d.\=
n", r);
> > +        goto finish;
> > +    }
> > +
> > +    printf ("connection: %s\n", connection);
> > +
> > +    // Open the system bus where most system services are provided.
> > +    r =3D sd_bus_open_system (&bus);
> > +
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to connect to system bus: %s\n", stre=
rror (-r));
> > +        goto finish;
> > +    }
> > +
> > +    /*
> > +     * Bus, service, object path, interface and method are provided to=
 call
> > +     * the method.
> > +     * Signatures and input arguments are provided by the arguments at=
 the
> > +     * end.
> > +     */
> > +    r =3D sd_bus_call_method (bus,
> > +                            connection,                               =
  /* service to contact */
> > +                            settings_object_name,                     =
  /* object path */
> > +                            settings_intf_name,                       =
  /* interface name */
> > +                            "Get",                                    =
  /* method name */
> > +                            &error,                                   =
  /* object to return error in */
> > +                            &m,                                       =
  /* return message on success */
> > +                            "ss",                                     =
  /* input signature */
> > +                            settings_intf_name,                       =
  /* first argument */
> > +                            "boot_flags");                            =
  /* second argument */
> > +
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to issue method call: %s\n", error.me=
ssage);
> > +        goto finish;
> > +    }
> > +
> > +    /*
> > +     * The output should be parsed exactly the same as the output form=
atting
> > +     * specified.
> > +     */
> > +    r =3D sd_bus_message_read (m, "v", "s", &temp_buf);
> > +
>=20
> Why not just read a "s"?
>=20
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to parse response message: %s\n", str=
error (-r));
> > +        goto finish;
> > +    }
> > +
> > +    printf ("IPMID boot option property get: {%s}.\n", (char *) temp_b=
uf);
> > +
> > +    /*
> > +     * To represent a hex in string, e.g., "A0A0", which represents tw=
o bytes
> > +     * in the hex, but requires 5 bytes to store it as string, i.e., 4
> > +     * characters to store the "A0A0" and 1 additional space for "\0".
> > +     * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
> > +     */
>=20
> So why don't you have #define NUM_RETURN_BYTES_OF_GET_USED 11 ?
>=20
> This question is out of scope of this patch but why are we passing around
> numbers as strings? dbus handles other types...
>=20
> > +    memcpy (buf, temp_buf, 2 * NUM_RETURN_BYTES_OF_GET_USED + 1);
> > +
> > +finish:
> > +    sd_bus_error_free (&error);
> > +    sd_bus_message_unref (m);
> > +    sd_bus_unref (bus);
> > +    free (connection);
> > +
> > +    return r;
> > +}
> > +
> > +int dbus_set_property (const char * buf)
> > +{
> > +    sd_bus_error error =3D SD_BUS_ERROR_NULL;
> > +    sd_bus_message * m =3D NULL;
> > +    sd_bus * bus =3D NULL;
> > +    char * connection =3D NULL;
> > +    int r;
> > +
> > +    r =3D object_mapper_get_connection (&connection, settings_object_n=
ame);
> > +
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to get connection, return value: %d.\=
n", r);
> > +        goto finish;
> > +    }
> > +
> > +    printf ("connection: %s\n", connection);
> > +
> > +    // Open the system bus where most system services are provided.
> > +    r =3D sd_bus_open_system (&bus);
> > +
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to connect to system bus: %s\n", stre=
rror (-r));
> > +        goto finish;
> > +    }
> > +
> > +    /*
> > +     * Bus, service, object path, interface and method are provided to=
 call
> > +     * the method.
> > +     * Signatures and input arguments are provided by the arguments at=
 the
> > +     * end.
> > +     */
> > +    r =3D sd_bus_call_method (bus,
> > +                            connection,                               =
  /* service to contact */
> > +                            settings_object_name,                     =
  /* object path */
> > +                            settings_intf_name,                       =
  /* interface name */
> > +                            "Set",                                    =
  /* method name */
> > +                            &error,                                   =
  /* object to return error in */
> > +                            &m,                                       =
  /* return message on success */
> > +                            "ssv",                                    =
  /* input signature */
> > +                            settings_intf_name,                       =
  /* first argument */
> > +                            "boot_flags",                             =
  /* second argument */
> > +                            "s",                                      =
  /* third argument */
> > +                            buf);                                     =
  /* fourth argument */
> > +
>=20
> Are we documenting these interfaces at all, I don't understand why "ssv" =
and
> then a hardcoded "s", why not "sss"?
>=20
> > +    if (r < 0) {
> > +        fprintf (stderr, "Failed to issue method call: %s\n", error.me=
ssage);
> > +        goto finish;
> > +    }
> > +
> > +    printf ("IPMID boot option property set: {%s}.\n", buf);
> > +
> > +finish:
> > +    sd_bus_error_free (&error);
> > +    sd_bus_message_unref (m);
> > +    sd_bus_unref (bus);
> > +    free (connection);
> > +
> > + &nbsp;  return r;
> > +}
> > +
> > +void register_netfn_chassis_functions () __attribute__ ((constructor));
> > =20
> >  struct get_sys_boot_options_t {
> >      uint8_t parameter;
> > @@ -17,11 +241,28 @@ struct get_sys_boot_options_t {
> >      uint8_t block;
> >  }  __attribute__ ((packed));
> > =20
> > -ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> > -                              ipmi_request_t request, ipmi_response_t =
response,
> > -                              ipmi_data_len_t data_len, ipmi_context_t=
 context)
> > +struct set_sys_boot_options_t {
> > +    uint8_t parameter;
> > +    union {
> > +        struct {
> > +            uint8_t d1;
> > +            uint8_t d2;
> > +            uint8_t d3;
> > +            uint8_t d4;
> > +            uint8_t d5;
> > +            uint8_t d6;
> > +            uint8_t d7;
> > +            uint8_t d8;
> > +        } data8;
> > +        uint64_t data64;
> > +    } data;
> > +}  __attribute__ ((packed));
> > +
> > +ipmi_ret_t ipmi_chassis_wildcard (ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> > +                                  ipmi_request_t request, ipmi_respons=
e_t response,
> > +                                  ipmi_data_len_t data_len, ipmi_conte=
xt_t context)
> >  {
> > -    printf("Handling CHASSIS WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netf=
n, cmd);
> > +    printf ("Handling CHASSIS WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n", ne=
tfn, cmd);
>=20
> Be careful with changes like this, you didn't change this code...
>=20
> >      // Status code.
> >      ipmi_ret_t rc =3D IPMI_CC_OK;
> >      *data_len =3D 0;
> > @@ -31,116 +272,193 @@ ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t ne=
tfn, ipmi_cmd_t cmd,
> >  //------------------------------------------------------------
> >  // Calls into Chassis Control Dbus object to do the power off
> >  //------------------------------------------------------------
> > -int ipmi_chassis_power_control(const char *method)
> > +int ipmi_chassis_power_control (const char * method)
> >  {
> > - // sd_bus error
> > - int rc =3D 0;
> > +    // sd_bus error
> > +    int rc =3D 0;
> > =20
> >      // SD Bus error report mechanism.
> >      sd_bus_error bus_error =3D SD_BUS_ERROR_NULL;
> > =20
> > - // Response from the call. Although there is no response for this cal=
l,
> > - // obligated to mention this to make compiler happy.
> > - sd_bus_message *response =3D NULL;
> > -
> > - // Gets a hook onto either a SYSTEM or SESSION bus
> > - sd_bus *bus_type =3D ipmid_get_sd_bus_connection();
> > -
> > - rc =3D sd_bus_call_method(bus_type,         // On the System Bus
> > - chassis_bus_name,        // Service to contact
> > - chassis_object_name,     // Object path
> > - chassis_intf_name,       // Interface name
> > - method,       // Method to be called
> > - &bus_error,       // object to return error
> > - &response, // Response buffer if any
> > - NULL); // No input arguments
> > - if(rc < 0)
> > - {
> > - fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus_error.message);
> > - }
> > - else
> > - {
> > - printf("Chassis Power Off initiated successfully\n");
> > - }
> > -
> > -    sd_bus_error_free(&bus_error);
> > -    sd_bus_message_unref(response);
> > -
> > - return rc;
> > +    /*
> > +     * Response from the call. Although there is no response for this =
call,
> > +     * obligated to mention this to make compiler happy.
> > +     */
> > +    sd_bus_message * response =3D NULL;
> > +
> > +    // Gets a hook onto either a SYSTEM or SESSION bus
> > +    sd_bus * bus_type =3D ipmid_get_sd_bus_connection ();
> > +
> > +    rc =3D sd_bus_call_method (bus_type,                /* On the Syst=
em Bus*/
> > +                             chassis_bus_name,        /* Service to co=
ntact*/
> > +                             chassis_object_name,     /* Object path*/
> > +                             chassis_intf_name,       /* Interface nam=
e*/
> > +                             method,                  /* Method to be =
called*/
> > +                             &bus_error,              /* object to ret=
urn error*/
> > +                             &response,               /* Response buff=
er if any*/
> > +                             NULL);                   /* No input argu=
ments*/
> > +
> > +    if (rc < 0) {
> > +        fprintf (stderr, "ERROR initiating Power Off:[%s]\n", bus_erro=
r.message);
> > +    } else {
> > +        printf ("Chassis Power Off initiated successfully\n");
> > +    }
> > +
> > +    sd_bus_error_free (&bus_error);
> > +    sd_bus_message_unref (response);
> > +
> > +    return rc;
>=20
> Cleanups are great but please send them as a separate patch, this helps p=
eople
> a lot when reviewing patches, if it is just a cleanup then people can foc=
us on
> checking that you didn't change behaviour OR if you're sending a function=
al
> change patch people can focus on checking that you're achieving what you =
set
> out to do.
>=20
> >  }
> > =20
> > =20
> >  //--------------------------------------------------------------------=
--
> >  // Chassis Control commands
> >  //--------------------------------------------------------------------=
--
> > -ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> > -                        ipmi_request_t request, ipmi_response_t respon=
se,
> > -                        ipmi_data_len_t data_len, ipmi_context_t conte=
xt)
> > +ipmi_ret_t ipmi_chassis_control (ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> > +                                 ipmi_request_t request, ipmi_response=
_t response,
> > +                     &nbsp;           ipmi_data_len_t data_len, ipmi_c=
ontext_t context)
> >  {
> > - // Error from power off.
> > - int rc =3D 0;
> > +    // Error from power off.
> > +    int rc =3D 0;
> > =20
> > - // No response for this command.
> > +    // No response for this command.
> >      *data_len =3D 0;
> > =20
> > - // Catch the actual operaton by peeking into request buffer
> > - uint8_t chassis_ctrl_cmd =3D *(uint8_t *)request;
> > - printf("Chassis Control Command: Operation:[0x%X]\n",chassis_ctrl_cmd=
);
> > -
> > - switch(chassis_ctrl_cmd)
> > - {
> > - case CMD_POWER_OFF:
> > - rc =3D ipmi_chassis_power_control("powerOff");
> > - break;
> > - case CMD_HARD_RESET:
> > - rc =3D ipmi_chassis_power_control("reboot");
> > - break;
> > - default:
> > - {
> > - fprintf(stderr, "Invalid Chassis Control command:[0x%X] received\n",c=
hassis_ctrl_cmd);
> > - rc =3D -1;
> > - }
> > - }
> > -
> > - return ( (rc < 0) ? IPMI_CC_INVALID : IPMI_CC_OK);
> > +    // Catch the actual operaton by peeking into request buffer
> > +    uint8_t chassis_ctrl_cmd =3D * (uint8_t *)request;
> > +    printf ("Chassis Control Command: Operation:[0x%X]\n", chassis_ctr=
l_cmd);
> > +
> > +    switch (chassis_ctrl_cmd) {
> > +    case CMD_POWER_OFF:
> > +        rc =3D ipmi_chassis_power_control ("powerOff");
> > +        break;
> > +
> > +    case CMD_HARD_RESET:
> > +        rc =3D ipmi_chassis_power_control ("reboot");
> > +        break;
> > +
> > +    default: {
> > +        fprintf (stderr, "Invalid Chassis Control command:[0x%X] recei=
ved\n", chassis_ctrl_cmd);
> > +        rc =3D -1;
> > +    }
> > +    }
> > +
> > +    return ((rc < 0) ? IPMI_CC_INVALID : IPMI_CC_OK);
> >  }
> > =20
> > -ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_=
cmd_t cmd,
> > -                              ipmi_request_t request, ipmi_response_t =
response,
> > -                              ipmi_data_len_t data_len, ipmi_context_t=
 context)
> > +ipmi_ret_t ipmi_chassis_get_sys_boot_options (ipmi_netfn_t netfn, ipmi=
_cmd_t cmd,
> > +        ipmi_request_t request, ipmi_response_t response,
> > +        ipmi_data_len_t data_len, ipmi_context_t context)
> >  {
> >      ipmi_ret_t rc =3D IPMI_CC_OK;
> >      *data_len =3D 0;
> > =20
> > -    printf("IPMI GET_SYS_BOOT_OPTIONS\n");
> > +    printf ("IPMI GET_SYS_BOOT_OPTIONS\n");
> > +
> > +    get_sys_boot_options_t * reqptr =3D (get_sys_boot_options_t *) req=
uest;
> > +
> > +    /*
> > +     * To represent a hex in string, e.g., "A0A0", which represents tw=
o bytes
> > +     * in the hex, but requires 5 bytes to store it as string, i.e., 4
> > +     * characters to store the "A0A0" and 1 additional space for "\0".
> > +     * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
> > +     */
> > +    char buf[NUM_RETURN_BYTES_OF_GET * 2 + 1] =3D {0};
>=20
> Once again, why not #define NUM_RETURN_BYTES_OF_GET 11
>=20
> > =20
> > -    get_sys_boot_options_t *reqptr =3D (get_sys_boot_options_t*) reque=
st;
> > +    /*
> > +     * Parameter #5 means boot flags. Please refer to 28.13 of ipmi do=
c.
> > +     * This is the only parameter used by petitboot.
> > +     */
> > +    if (reqptr->parameter =3D=3D 5) {
> > +        int r =3D dbus_get_property (buf);
> > =20
> > -    // TODO Return default values to OPAL until dbus interface is avai=
lable
> > +        if (r < 0) {
> > +            fprintf (stderr, "Dbus get property failed for get_sys_boo=
t_options.\n");
> > +            return IPMI_OUT_OF_SPACE;
> > +        }
> > =20
> > -    if (reqptr->parameter =3D=3D 5) // Parameter #5
> > -    {
> > -        uint8_t buf[] =3D {0x1,0x5,80,0,0,0,0};
> > -        *data_len =3D sizeof(buf);
> > -        memcpy(response, &buf, *data_len);
> > +        uint64_t return_value;
> > +        sscanf (buf, "%llX", &return_value);
>=20
> See my comment at the top about the best tool for the job.
>=20
> > +
> > +        *data_len =3D NUM_RETURN_BYTES_OF_GET;
> > +        /*
> > +         * TODO: last 3 bytes
> > +         *(NUM_RETURN_BYTES_OF_GET - NUM_RETURN_BYTES_OF_GET_USED) is =
meanlingless
> > +         */
> > +        memcpy (response, (uint8_t *) (&return_value), *data_len);
>=20
> So this interests me, does whoever is going to be reading response know t=
o read
> it as a uint64_t on success but as an array of chars on failure, also, ra=
ther
> than #defineing, wouldn't:
>=20
> *data_len =3D sizeof(return_value);
>=20
> be better?
>=20
>=20
> I've done some looking around in ipmid.C and I don't think what you've do=
ne
> will work,
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/ipmid.C#L276
> appears to use the first byte of response as the completion code but you'=
ve
> just written whatever the first byte of your uint64_t is into response[0]=
...
>=20
> Also, 28.13 in the IPMI spec doesn't seem to match up with whats going on=
 here,
> am I missing something?
>=20
> > +    } else {
> > +        *data_len =3D NUM_RETURN_BYTES_OF_GET;
> > +        // Parameter not supported
> > +        buf[0] =3D IPMI_CC_PARM_NOT_SUPPORTED;
> > +        memcpy (response, buf, *data_len);
> > +        fprintf (stderr, "Unsupported parameter 0x%x\n", reqptr->param=
eter);
> > +        return IPMI_CC_PARM_NOT_SUPPORTED;
> >      }
> > -    else
> > -    {
> > -        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parame=
ter);
> > -        return IPMI_CC_PARM_NOT_SUPPORTED;       =20
> > +
> > +    return rc;
> > +}
> > +
> > +ipmi_ret_t ipmi_chassis_set_sys_boot_options (ipmi_netfn_t netfn, ipmi=
_cmd_t cmd,
> > +        ipmi_request_t request, ipmi_response_t response,
> > +        ipmi_data_len_t data_len, ipmi_context_t context)
> > +{
> > +    ipmi_ret_t rc =3D IPMI_CC_OK;
> > +
> > +    printf ("IPMI SET_SYS_BOOT_OPTIONS\n");
> > +    printf ("IPMID set command required return bytes: %i\n", *data_len=
);
> > +
> > +    set_sys_boot_options_t * reqptr =3D (set_sys_boot_options_t *) req=
uest;
> > +
> > +    char output_buf[NUM_RETURN_BYTES_OF_SET] =3D {0};
> > +
> > +    /*
> > +     * Parameter #5 means boot flags. Please refer to 28.13 of ipmi do=
c.
> > +     * This is the only parameter used by petitboot.
> > +     */
> > +    if (reqptr->parameter =3D=3D 5) {
> > +        /*
> > +         * To represent a hex in string, e.g., "A0A0", which represent=
s two bytes
> > +         * in the hex, but requires 5 bytes to store it as string, i.e=
., 4
> > +         * characters to store the "A0A0" and 1 additional space for "=
\0".
> > +         * Thereby we have 2 * <number of bytes> + 1 for the string bu=
ffer.
> > +         */
> > +        char input_buf[NUM_INPUT_BYTES_OF_SET * 2 + 1];
> > +        sprintf (input_buf, "%llX", reqptr->data.data64);
> > +
> > +        int r =3D dbus_set_property (input_buf);
> > +
> > +        if (r < 0) {
> > +            fprintf (stderr, "Dbus set property failed for set_sys_boo=
t_options.\n");
> > +            return IPMI_OUT_OF_SPACE;
> > +        }
> > +
> > +        *data_len =3D NUM_RETURN_BYTES_OF_SET;
> > +        // Return code OK.
> > +        output_buf[0] =3D IPMI_OK;
> > +        memcpy (response, output_buf, *data_len);
> > +    } else {
> > +        // Parameter not supported
> > +        output_buf[0] =3D IPMI_CC_PARM_NOT_SUPPORTED;
> > +        memcpy (response, output_buf, *data_len);
> > +        fprintf (stderr, "Unsupported parameter 0x%x\n", reqptr->param=
eter);
> > +        return IPMI_CC_PARM_NOT_SUPPORTED;
>=20
> As far as I can see you're simply using output_buf to assign the first by=
te of
> response to either IPMI_OK or IPMI_CC_PARM_NOT_SUPPORTED and you're using
> memcpy.
>=20
> Wouldn't it be nicer to
> memset(response, 0, *data_len);
> (or not even memset since NUM_RETURN_BYTES_OF_SET is 1) and
> *response =3D IPMI_OK;
> or
> *response =3D IPMI_CC_PARM_NOT_SUPPORTED;
> and avoid having output_buf at all?
>=20
> Which makes me wonder why response is actually a void *, is this a good i=
dea?
>=20
> >      }
> > =20
> >      return rc;
> >  }
> > =20
> > -void register_netfn_chassis_functions()
> > +void register_netfn_chassis_functions ()
> >  {
> > -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IP=
MI_CMD_WILDCARD);
> > -    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_WILDCARD, NULL, ip=
mi_chassis_wildcard);
> > +    printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, =
IPMI_CMD_WILDCARD);
> > +    ipmi_register_callback (NETFUN_CHASSIS, IPMI_CMD_WILDCARD, NULL, i=
pmi_chassis_wildcard);
> > =20
> > -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IP=
MI_CMD_GET_SYS_BOOT_OPTIONS);
> > -    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIO=
NS, NULL, ipmi_chassis_get_sys_boot_options);
> > +    printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, =
IPMI_CMD_GET_SYS_BOOT_OPTIONS);
> > +    ipmi_register_callback (NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTI=
ONS, NULL, ipmi_chassis_get_sys_boot_options);
> > =20
> > -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IP=
MI_CMD_CHASSIS_CONTROL);
> > -    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, N=
ULL, ipmi_chassis_control);
> > +    printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, =
IPMI_CMD_SET_SYS_BOOT_OPTIONS);
> > +    ipmi_register_callback (NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTI=
ONS, NULL, ipmi_chassis_set_sys_boot_options);
> > +
> > +    printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, =
IPMI_CMD_CHASSIS_CONTROL);
> > +    ipmi_register_callback (NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, =
NULL, ipmi_chassis_control);
> >  }
> > +
> > diff --git a/chassishandler.h b/chassishandler.h
> > index 1a26411..a310741 100644
> > --- a/chassishandler.h
> > +++ b/chassishandler.h
> > @@ -3,21 +3,39 @@
> > =20
> >  #include <stdint.h>
> > =20
> > +// TODO: Petitboot requires 8 bytes of response
> > +// however only 5 of them are used. The remaining
> > +// 3 bytes are not used in petitboot and the value
> > +// of them are all zero.
> > +#define NUM_RETURN_BYTES_OF_GET 8
> > +#define NUM_RETURN_BYTES_OF_GET_USED 5
> > +#define NUM_RETURN_BYTES_OF_SET 1
> > +#define NUM_INPUT_BYTES_OF_SET 5
> > +
> >  // IPMI commands for Chassis net functions.
> >  enum ipmi_netfn_app_cmds
> >  {
> >   // Chassis Control
> >   IPMI_CMD_CHASSIS_CONTROL  =3D 0x02,
> >      // Get capability bits
> > +    IPMI_CMD_SET_SYS_BOOT_OPTIONS =3D 0x08,
> >      IPMI_CMD_GET_SYS_BOOT_OPTIONS =3D 0x09,
> >  };
> > =20
> >  // Command specific completion codes
> >  enum ipmi_chassis_return_codes
> >  {
> > +    IPMI_OK =3D 0x0,
> >      IPMI_CC_PARM_NOT_SUPPORTED =3D 0x80,
> >  };
> > =20
> > +// Generic completion codes,
> > +// see IPMI doc section 5.2
> > +enum ipmi_generic_return_codes
> > +{
> > +    IPMI_OUT_OF_SPACE =3D 0xC4,
> > +};
> > +
> >  // Various Chassis operations under a single command.
> >  enum ipmi_chassis_control_cmds : uint8_t
> >  {
> =20
> =20
>=20
>=20
