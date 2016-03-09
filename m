Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp04.in.ibm.com (e28smtp04.in.ibm.com [125.16.236.4])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5B7D01A0BA7
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 16:53:19 +1100 (AEDT)
Received: from localhost
 by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 9 Mar 2016 11:23:16 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
 by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 9 Mar 2016 11:23:12 +0530
X-IBM-Helo: d28relay05.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u295quXu19398962
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:22:57 +0530
Message-Id: <201603090552.u295quXu19398962@d28relay05.in.ibm.com>
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 8 Mar 2016 22:53:08 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 8 Mar 2016 22:53:06 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 9 Mar 2016 05:53:05 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 9 Mar 2016 05:53:03 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016030905530320-34685 ;
 Wed, 9 Mar 2016 05:53:03 +0000 
In-Reply-To: <20160309102411.5654f1b3@camb691>
Subject: Re: [PATCH phosphor-host-ipmid v4] memory leak found during multiple
 reboots. it was found that in many cases the reply was not unref'ed
To: Cyril Bur <cyrilbur@gmail.com>
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Wed, 9 Mar 2016 11:23:01 +0530
References: <1456900828-20255-1-git-send-email-openbmc-patches@stwcx.xyz><1456900828-20255-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160309102411.5654f1b3@camb691>
X-KeepSent: E843E588:EBAF0334-65257F71:001DD04E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 2451
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF5E2DF8E56DE8f9e8a93df938690918cEABBF5E2DF8E56DE"
Content-Disposition: inline
x-cbid: 16030905-0013-0000-0000-00000AA99EBE
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0.294059; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005014; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00670704; UDB=6.00306437; UTC=2016-03-09
 05:53:04
x-cbparentid: 16030905-5938-0000-0000-0000026AF24C
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
X-List-Received-Date: Wed, 09 Mar 2016 05:53:20 -0000


--0__=EABBF5E2DF8E56DE8f9e8a93df938690918cEABBF5E2DF8E56DE
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Thanks for the comments.. I responded inline.

Thanks

---------------------------------------------------------------------------=
----------

Thanks and Regards,
Vishwanath.
Advisory Software Engineer,
Power Firmware Development,
Systems &Technology Lab,
MG2-6F-255 , Manyata Embassy Business Park,
Bangalore , KA , 560045
Ph: +91-80-46678255
E-mail: vishwanath@in.ibm.com
---------------------------------------------------------------------------=
-------

Cyril Bur <cyrilbur@gmail.com> wrote on 09/03/2016 04:54:11 am:

> From: Cyril Bur <cyrilbur@gmail.com>
> To: Vishwanatha Subbanna/India/IBM@IBMIN
> Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
> Date: 09/03/2016 04:54 am
> Subject: Re: [PATCH phosphor-host-ipmid v4] memory leak found during
> multiple reboots. it was found that in many cases the reply was not
unref'ed
>
> On Wed,  2 Mar 2016 00:40:28 -0600
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
>
> > From: vishwa <vishwanath@in.ibm.com>
> >
> > --signed off by vishwanath@in.ibm.com---
> > ---
> >  apphandler.C       | 150 ++++++++++++++++++----------------------
> >  host-services.c    |   2 +-
> >  ipmid.C            |  53 +++++++-------
> >  sensorhandler.C    |   2 +-
> >  storageaddsel.C    |   4 +-
> >  transporthandler.C | 199 ++++++++++++++++++++++
> +------------------------------
> >  6 files changed, 182 insertions(+), 228 deletions(-)
> >
> > diff --git a/apphandler.C b/apphandler.C
> > index a48059f..a921643 100644
> > --- a/apphandler.C
> > +++ b/apphandler.C
> > @@ -119,11 +119,22 @@ ipmi=5Fret=5Ft
> ipmi=5Fapp=5Fget=5Fdevice=5Fguid(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft c=
md,
> >      const char  *objname =3D "/org/openbmc/control/chassis0";
> >      const char  *iface =3D "org.freedesktop.DBus.Properties";
> >      const char  *chassis=5Fiface =3D "org.openbmc.control.Chassis";
> > -    sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;
> > +    sd=5Fbus=5Fmessage *reply =3D NULL;
> >      sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> >      int r =3D 0;
> >      char *uuid =3D NULL;
> >
> > +    // UUID is in RFC4122 format. Ex:
61a39523-78f2-11e5-9862-e6402cfc3223
> > +    // Per IPMI Spec 2.0 need to convert to 16 hex bytes and
> reverse the byte order
> > +    // Ex: 0x2332fc2c40e66298e511f2782395a361
> > +
> > +    const int resp=5Fsize =3D 16; // Response is 16 hex bytes per IPMI
Spec
> > +    uint8=5Ft resp=5Fuuid[resp=5Fsize]; // Array to hold the formatted
response
> > +    int resp=5Floc =3D resp=5Fsize-1; // Point resp end of array to
> save in reverse order
> > +    int i =3D 0;
> > +    char *tokptr =3D NULL;
> > +    char *id=5Foctet =3D NULL;
> > +
> >      // Status code.
> >      ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
> >      *data=5Flen =3D 0;
> > @@ -131,49 +142,33 @@ ipmi=5Fret=5Ft
> ipmi=5Fapp=5Fget=5Fdevice=5Fguid(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft c=
md,
> >      printf("IPMI GET DEVICE GUID\n");
> >
> >      // Call Get properties method with the interface and property name
> > -    r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall
(bus,&m,busname,objname,iface,"Get");
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to add the Get method object: %s
> \n", strerror(-r));
> > -        return IPMI=5FCC=5FUNSPECIFIED=5FERROR;
> > -    }
> > -    r =3D sd=5Fbus=5Fmessage=5Fappend(m, "ss", chassis=5Fiface, "uuid"=
);
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to append arguments: %s\n", strerror
(-r));
> > -        return -1;
> > -    }
> > -    r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to call the Get method: %s\n",
> strerror(-r));
> > -        return IPMI=5FCC=5FUNSPECIFIED=5FERROR;
> > +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus,busname,objname,iface,
> > +                           "Get",&error, &reply, "ss",
> > +                           chassis=5Fiface, "uuid");
> > +    if (r < 0)
> > +    {
> > +        fprintf(stderr, "Failed to call Get Method: %s\n", strerror
(-r));
> > +        rc =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;
> > +        goto finish;
> >      }
> > +
>
> The above looks like a rework, not really addressing a memory leak
> specifically? The rework looks good to me but can we please start
splitting
> patches up and do what the commit message says in each patch.
>
> This series would have been better with (at least) the above being in one
> commit entitled something like "Rework ipmi=5Fapp=5Fget=5Fdevice=5Fguid()=
 dbud
message
> handling" and then an explanation as to why this way is better.
>

Okay... I had 2 approaches in front of me. Handle memory leak in the old
way first and then in the next patch, undo what I had done before and do it
using new API and handle the leak also in the new approach. I am not
totally agreeing on this since there is a do-undo-redo effort involved
here. BTW, is doing a code rework also not a method to fix the leaks if we
had some issues in the way it was before ?

> >      r =3D sd=5Fbus=5Fmessage=5Fread(reply, "v", "s", &uuid);
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
> > -        return IPMI=5FCC=5FRESPONSE=5FERROR;
> > -    }
> > -    if (uuid =3D=3D NULL)
> > +    if (r < 0 || uuid =3D=3D NULL)
> >      {
> > -        fprintf(stderr, "Failed to get a valid response: %s",
> strerror(-r));
> > -        return IPMI=5FCC=5FRESPONSE=5FERROR;
> > +        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
> > +        rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;
> > +        goto finish;
> >      }
> >
> > -    // UUID is in RFC4122 format. Ex:
61a39523-78f2-11e5-9862-e6402cfc3223
> > -    // Per IPMI Spec 2.0 need to convert to 16 hex bytes and
> reverse the byte order
> > -    // Ex: 0x2332fc2c40e66298e511f2782395a361
> > -
> > -    const int resp=5Fsize =3D 16; // Response is 16 hex bytes per IPMI
Spec
> > -    uint8=5Ft resp=5Fuuid[resp=5Fsize]; // Array to hold the formatted
response
> > -    int resp=5Floc =3D resp=5Fsize-1; // Point resp end of array to
> save in reverse order
> > -    int i =3D 0;
> > -    char *tokptr =3D NULL;
> > -
> >      // Traverse the UUID
> > -    char* id=5Foctet =3D strtok=5Fr(uuid, "-", &tokptr); // Get the
> UUID octects separated by dash
> > +    id=5Foctet =3D strtok=5Fr(uuid, "-", &tokptr); // Get the UUID
> octects separated by dash
> >
> >      if (id=5Foctet =3D=3D NULL)
> > -    { // Error
> > +    {
> > +        // Error
> >          fprintf(stderr, "Unexpected UUID format: %s", uuid);
> > -        return IPMI=5FCC=5FRESPONSE=5FERROR;
> > +        rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;
> > +        goto finish;
> >      }
> >
> >      while (id=5Foctet !=3D NULL)
> > @@ -201,8 +196,9 @@ ipmi=5Fret=5Ft
> ipmi=5Fapp=5Fget=5Fdevice=5Fguid(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft c=
md,
> >      // Pack the actual response
> >      memcpy(response, &resp=5Fuuid, *data=5Flen);
> >
> > +finish:
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> >
> >      return rc;
> >  }
> > @@ -246,15 +242,13 @@ ipmi=5Fret=5Ft
> ipmi=5Fapp=5Fset=5Fwatchdog(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> >      const char  *busname =3D "org.openbmc.watchdog.Host";
> >      const char  *objname =3D "/org/openbmc/watchdog/host0";
> >      const char  *iface =3D "org.openbmc.Watchdog";
> > -    sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;
> > +    sd=5Fbus=5Fmessage *reply =3D NULL;
> >      sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> >      int r =3D 0;
> >
> >      set=5Fwd=5Fdata=5Ft *reqptr =3D (set=5Fwd=5Fdata=5Ft*) request;
> >      uint16=5Ft timer =3D 0;
> >      uint32=5Ft timer=5Fms =3D 0;
> > -    // Status code.
> > -    ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
> >
> >      *data=5Flen =3D 0;
> >
> > @@ -266,53 +260,45 @@ ipmi=5Fret=5Ft
> ipmi=5Fapp=5Fset=5Fwatchdog(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> >      printf("WATCHDOG SET Timer:[0x%X] 100ms intervals\n",timer);
> >
> >      // Set watchdog timer
> > -    r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall
(bus,&m,busname,objname,iface,"set");
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to add the set method object: %s
> \n", strerror(-r));
> > -        return -1;
> > -    }
> > -    r =3D sd=5Fbus=5Fmessage=5Fappend(m, "i", timer=5Fms);
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to add timer value: %s\n", strerror
(-r));
> > -        return -1;
> > -    }
> > -    r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to call the set method: %s\n",
> strerror(-r));
> > -        return -1;
> > +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus, busname, objname, iface,
> > +                           "set", &error, &reply, "i", timer=5Fms);
> > +    if(r < 0)
> > +    {
> > +        fprintf(stderr, "Failed to call the SET method: %s\n",
> strerror(-r));
> > +        goto finish;
> >      }
> >
> > +    sd=5Fbus=5Ferror=5Ffree(&error);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> > +
>
> So here you're sort of reworking AND fixing the leaks.
> In terms of fixing the leaks can't you just pass NULL instead of
> reply? I could
> be wrong here but I believe that sd=5Fbus will handle passing NULL and
realise
> that you don't care about the reply (which, AFAICT, you don't).
>

Sorry but I don't understand "Pass the NULL instead of reply". Pass the
NULL where ?.
The way its done here is per one of the approaches followed in systemd code
and I followed the same.
I may have not consumed the reply here but just thinking futuristic to
avoid any dangling pointer issues if they were to be re used.

from sd-bus/bus-message.C
---------------------------

=5Fpublic=5F sd=5Fbus=5Fmessage* sd=5Fbus=5Fmessage=5Funref(sd=5Fbus=5Fmess=
age *m) {

        if (!m)
                return NULL;

        assert(m->n=5Fref > 0);
        m->n=5Fref--;

        if (m->n=5Fref > 0)
                return NULL;

        message=5Ffree(m);
        return NULL;
}


> >      // Stop the current watchdog if any
> > -    r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m,busname,objname,iface,"st=
op");
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to add the start method object:
> %s\n", strerror(-r));
> > -        return -1;
> > -    }
> > -    r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to call the start method: %s\n",
> strerror(-r));
> > -        return -1;
> > +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus, busname, objname, iface,
> > +                           "stop", &error, &reply, NULL);
> > +    if(r < 0)
> > +    {
> > +        fprintf(stderr, "Failed to call the STOP method: %s\n",
> strerror(-r));
> > +        goto finish;
> >      }
> >
> > -    // Start the watchdog if requested
> >      if (reqptr->t=5Fuse & 0x40)
> >      {
> > -        r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m,busname,objname,iface,"st=
art");
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to add the start method
> object: %s\n", strerror(-r));
> > -            return -1;
> > -        }
> > -        r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to call the start method: %s
> \n", strerror(-r));
> > -            return -1;
> > +        sd=5Fbus=5Ferror=5Ffree(&error);
> > +        reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> > +
> > +        // Start the watchdog if requested
> > +        r =3D sd=5Fbus=5Fcall=5Fmethod(bus, busname, objname, iface,
> > +                               "start", &error, &reply, NULL);
> > +        if(r < 0)
> > +        {
> > +            fprintf(stderr, "Failed to call the START method: %s
> \n", strerror(-r));
> >          }
> >      }
> >
> > +finish:
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> >
> > -    return rc;
> > +    return (r < 0) ? -1 : IPMI=5FCC=5FOK;
> >  }
> >
> >
> > @@ -323,7 +309,7 @@ ipmi=5Fret=5Ft
> ipmi=5Fapp=5Freset=5Fwatchdog(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> >      const char  *busname =3D "org.openbmc.watchdog.Host";
> >      const char  *objname =3D "/org/openbmc/watchdog/host0";
> >      const char  *iface =3D "org.openbmc.Watchdog";
> > -    sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;
> > +    sd=5Fbus=5Fmessage *reply =3D NULL;
> >      sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> >      int r =3D 0;
> >
> > @@ -334,19 +320,15 @@ ipmi=5Fret=5Ft
> ipmi=5Fapp=5Freset=5Fwatchdog(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> >      printf("WATCHDOG RESET\n");
> >
> >      // Refresh watchdog
> > -    r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m,busname,objname,iface,"po=
ke");
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to add the method object: %s\n",
> strerror(-r));
> > -        return -1;
> > -    }
> > -    r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus, busname, objname, iface,
> > +                           "poke", &error, &reply, NULL);
> >      if (r < 0) {
> > -        fprintf(stderr, "Failed to call the method: %s\n", strerror
(-r));
> > -        return -1;
> > +        fprintf(stderr, "Failed to add reset  watchdog: %s\n",
> strerror(-r));
> > +        rc =3D -1;
> >      }
> >
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> >
> >      return rc;
> >  }
> > diff --git a/host-services.c b/host-services.c
> > index 23aa55e..cc47439 100644
> > --- a/host-services.c
> > +++ b/host-services.c
> > @@ -68,7 +68,7 @@ static int soft=5Fpower=5Foff(sd=5Fbus=5Fmessage *m,
> void *userdata, sd=5Fbus=5Ferror *ret=5Fe
> >
> >  finish:
> >      sd=5Fbus=5Ferror=5Ffree(&bus=5Ferror);
> > -    sd=5Fbus=5Fmessage=5Funref(response);
> > +    response =3D sd=5Fbus=5Fmessage=5Funref(response);
> >
> >      if(rc < 0)
> >      {
> > diff --git a/ipmid.C b/ipmid.C
> > index 0f4139c..06fbf05 100644
> > --- a/ipmid.C
> > +++ b/ipmid.C
> > @@ -225,9 +225,8 @@ static int send=5Fipmi=5Fmessage(sd=5Fbus=5Fmessage
> *req, unsigned char seq, unsigned ch
> >
> >  final:
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > -    sd=5Fbus=5Fmessage=5Funref(reply);
> > -
> > +    m =3D sd=5Fbus=5Fmessage=5Funref(m);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
>
> Why this change? You don't check m or reply/...  the unref already
> happens. The
> only thing I can think that you're doing is fixing warnings (in which
case,
> separate patch and please say so) but quite frankly you shouldn't be
enabling
> those warnings, they're a pain.
>

I agree I am not consuming it here / passing the pointer back.. but it was
more of a good practise that I was following.
I am not sure which warning are you saying is a pain ?. Do you have an
example ? -or- are you generally saying
compiler should not warn for these types of message usages ?.

BTW, I did not fix any warnings.. That code was just being futuristic.

> >
> >      return r < 0 ? EXIT=5FFAILURE : EXIT=5FSUCCESS;
> >  }
> > @@ -246,13 +245,13 @@ static int
> handle=5Fipmi=5Fcommand(sd=5Fbus=5Fmessage *m, void *user=5Fdata, sd=5Fbu=
s=5Ferror
> >      r =3D sd=5Fbus=5Fmessage=5Fread(m, "yyyy",  &sequence, &netfn, &lu=
n,
&cmd);
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to parse signal message: %s\n",
> strerror(-r));
> > -        return -1;
> > +        goto final;
> >      }
> >
> >      r =3D sd=5Fbus=5Fmessage=5Fread=5Farray(m, 'y',  &request, &sz );
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to parse signal message: %s\n",
> strerror(-r));
> > -        return -1;
> > +        goto final;
> >      }
> >
> >      fprintf(ipmiio, "IPMI Incoming: Seq 0x%02x, NetFn 0x%02x,
> CMD: 0x%02x \n", sequence, netfn, cmd);
> > @@ -268,6 +267,7 @@ static int handle=5Fipmi=5Fcommand(sd=5Fbus=5Fmessa=
ge
> *m, void *user=5Fdata, sd=5Fbus=5Ferror
> >      if(r !=3D 0)
> >      {
> >          fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:
> [0x%X]\n",r, netfn, cmd);
> > +        goto final;
> >      }
> >
> >      fprintf(ipmiio, "IPMI Response:\n");
> > @@ -278,11 +278,12 @@ static int
> handle=5Fipmi=5Fcommand(sd=5Fbus=5Fmessage *m, void *user=5Fdata, sd=5Fbu=
s=5Ferror
> >            ((unsigned char *)response) + 1, resplen - 1);
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to send the response message\n");
> > -        return -1;
> >      }
> >
> > +final:
> > +    m =3D sd=5Fbus=5Fmessage=5Funref(m);
> >
> > -    return 0;
> > +    return (r < 0) ? -1 : 0;
> >  }
> >
> >
> > @@ -470,6 +471,7 @@ int
> find=5Finterface=5Fproperty=5Ffru=5Ftype(dbus=5Finterface=5Ft *interface,=
 const char
*pr
> >          fprintf(stderr, "Failed to create a method call: %s",
> strerror(-r));
> >          fprintf(stderr,"Bus: %s Path: %s Interface: %s \n",
> >                  interface->bus, interface->path, interface->
interface);
> > +        goto final;
> >      }
> >
> >      r =3D sd=5Fbus=5Fmessage=5Fappend(m, "ss",
> "org.openbmc.InventoryItem", property=5Fname);
> > @@ -477,6 +479,7 @@ int
> find=5Finterface=5Fproperty=5Ffru=5Ftype(dbus=5Finterface=5Ft *interface,=
 const char
*pr
> >          fprintf(stderr, "Failed to create a input parameter: %s",
> strerror(-r));
> >          fprintf(stderr,"Bus: %s Path: %s Interface: %s \n",
> >                  interface->bus, interface->path, interface->
interface);
> > +        goto final;
> >      }
> >
> >      r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > @@ -496,7 +499,8 @@ int
> find=5Finterface=5Fproperty=5Ffru=5Ftype(dbus=5Finterface=5Ft *interface,=
 const char
*pr
> >  final:
> >
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > +    m =3D sd=5Fbus=5Fmessage=5Funref(m);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> >
> >      return r;
> >  }
> > @@ -512,29 +516,18 @@ int find=5Fopenbmc=5Fpath(const char *type,
> const uint8=5Ft num, dbus=5Finterface=5Ft *int
> >
> >      char  *str1, *str2, *str3;
> >      sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> > -    sd=5Fbus=5Fmessage *reply =3D NULL, *m=3DNULL;
> > +    sd=5Fbus=5Fmessage *reply =3D NULL;
> >
> >
> >      int r;
> >
> > -    r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall
(bus,&m,busname,objname,busname,"getObjectFromByteId");
> > +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus,busname,objname,busname,
> "getObjectFromByteId",
> > +                           &error, &reply, "sy", type, num);
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to create a method call: %s",
> strerror(-r));
> > -    }
> > -
> > -    r =3D sd=5Fbus=5Fmessage=5Fappend(m, "sy", type, num);
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to create a input parameter: %s",
> strerror(-r));
> > -    }
> > -
> > -    // Call the IPMI responder on the bus so the message can be
> sent to the CEC
> > -    r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > -    if (r < 0) {
> > -        fprintf(stderr, "Failed to call the method: %s", strerror
(-r));
> >          goto final;
> >      }
> >
> > -
> >      r =3D sd=5Fbus=5Fmessage=5Fread(reply, "(sss)", &str1, &str2, &str=
3);
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to get a response: %s", strerror(-r));
> > @@ -550,7 +543,7 @@ int find=5Fopenbmc=5Fpath(const char *type, const
> uint8=5Ft num, dbus=5Finterface=5Ft *int
> >  final:
> >
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> >
> >      return r;
> >  }
> > @@ -577,11 +570,13 @@ int set=5Fsensor=5Fdbus=5Fstate=5Fs(uint8=5Ft num=
ber,
> const char *method, const char *valu
> >      r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m,a.bus,a.path,a.interface,=
method);
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to create a method call: %s",
> strerror(-r));
> > +        goto final;
> >      }
> >
> >      r =3D sd=5Fbus=5Fmessage=5Fappend(m, "v", "s", value);
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to create a input parameter: %s",
> strerror(-r));
> > +        goto final;
> >      }
> >
> >
> > @@ -590,9 +585,9 @@ int set=5Fsensor=5Fdbus=5Fstate=5Fs(uint8=5Ft numbe=
r,
> const char *method, const char *valu
> >          fprintf(stderr, "Failed to call the method: %s", strerror
(-r));
> >      }
> >
> > -
> > +final:
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > +    m =3D sd=5Fbus=5Fmessage=5Funref(m);
> >
> >      return 0;
> >  }
> > @@ -612,11 +607,13 @@ int set=5Fsensor=5Fdbus=5Fstate=5Fy(uint8=5Ft num=
ber,
> const char *method, const uint8=5Ft va
> >      r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m,a.bus,a.path,a.interface,=
method);
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to create a method call: %s",
> strerror(-r));
> > +        goto final;
> >      }
> >
> >      r =3D sd=5Fbus=5Fmessage=5Fappend(m, "v", "y", value);
> >      if (r < 0) {
> >          fprintf(stderr, "Failed to create a input parameter: %s",
> strerror(-r));
> > +        goto final;
> >      }
> >
> >
> > @@ -625,9 +622,9 @@ int set=5Fsensor=5Fdbus=5Fstate=5Fy(uint8=5Ft numbe=
r,
> const char *method, const uint8=5Ft va
> >          fprintf(stderr, "12 Failed to call the method: %s", strerror
(-r));
> >      }
> >
> > -
> > +final:
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > +    m =3D sd=5Fbus=5Fmessage=5Funref(m);
> >
> >      return 0;
> > -}
> > \ No newline at end of file
> > +}
> > diff --git a/sensorhandler.C b/sensorhandler.C
> > index d171bf5..90bfd0f 100644
> > --- a/sensorhandler.C
> > +++ b/sensorhandler.C
> > @@ -221,7 +221,7 @@ ipmi=5Fret=5Ft
> ipmi=5Fsen=5Fget=5Fsensor=5Freading(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5F=
t cmd,
> >      }
> >
> >
> > -    sd=5Fbus=5Fmessage=5Funref(reply);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> >
> >      return rc;
> >  }
> > diff --git a/storageaddsel.C b/storageaddsel.C
> > index 51edc59..cb90aab 100644
> > --- a/storageaddsel.C
> > +++ b/storageaddsel.C
> > @@ -193,8 +193,8 @@ int send=5Fesel=5Fto=5Fdbus(const char *desc, const
> char *sev, const char *details, ui
> >
> >  finish:
> >      sd=5Fbus=5Ferror=5Ffree(&error);
> > -    sd=5Fbus=5Fmessage=5Funref(m);
> > -    sd=5Fbus=5Fmessage=5Funref(reply);
> > +    m =3D sd=5Fbus=5Fmessage=5Funref(m);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> >      return r;
> >  }
> >
> > diff --git a/transporthandler.C b/transporthandler.C
> > index d43f1f9..0fd25f9 100644
> > --- a/transporthandler.C
> > +++ b/transporthandler.C
> > @@ -55,7 +55,7 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fne=
tfn=5Ft
> netfn, ipmi=5Fcmd=5Ft cmd,
> >      ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
> >      *data=5Flen =3D 0;
> >      sd=5Fbus *bus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();
> > -    sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;
> > +    sd=5Fbus=5Fmessage *reply =3D NULL;
> >      sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> >      int r =3D 0;
> >
> > @@ -84,20 +84,10 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fset=5Flan(ipmi=5F=
netfn=5Ft
> netfn, ipmi=5Fcmd=5Ft cmd,
> >                  reqptr->data[4],
> >                  reqptr->data[5]);
> >
> > -        r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m,app,obj,ifc,"SetHwAddress=
");
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to add method object: %s\n",
> strerror(-r));
> > -            return -1;
> > -        }
> > -        r =3D sd=5Fbus=5Fmessage=5Fappend(m, "s", mac);
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to append message data: %s
> \n", strerror(-r));
> > -            return -1;
> > -        }
> > -        r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > +        r =3D sd=5Fbus=5Fcall=5Fmethod(bus,app,obj,ifc,"SetHwAddress",
> > +                               &error, &reply, "s", mac);
> >          if (r < 0) {
> >              fprintf(stderr, "Failed to call method: %s\n", strerror
(-r));
> > -            return -1;
> >          }
> >      }
> >      else if (reqptr->parameter =3D=3D LAN=5FPARM=5FSUBNET)
> > @@ -112,84 +102,72 @@ ipmi=5Fret=5Ft
> ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> >      }
> >      else if (reqptr->parameter =3D=3D LAN=5FPARM=5FINPROGRESS) // Appl=
y config
> >      {
> > -        int rc =3D 0;
> > -        sd=5Fbus=5Fmessage *req =3D NULL;
> > -        sd=5Fbus=5Fmessage *res =3D NULL;
> > -        sd=5Fbus *bus1        =3D NULL;
> > -        sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL;
> > -
> >          if (!strcmp(new=5Fipaddr, "") || !strcmp (new=5Fnetmask, "")
> || !strcmp (new=5Fgateway, ""))
> >          {
> >              fprintf(stderr,"ERROR: Incomplete LAN Parameters\n");
> >              return -1;
> >          }
> > -
> > -        rc =3D sd=5Fbus=5Fopen=5Fsystem(&bus1);
> > -        if(rc < 0)
> > -        {
> > -            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> > -            return -1;
> > -        }
> >
> >          if (strcmp(cur=5Fipaddr, ""))
> >          {
> > -            sd=5Fbus=5Ferror=5Ffree(&err);
> > -            sd=5Fbus=5Fmessage=5Funref(req);
> > -            sd=5Fbus=5Fmessage=5Funref(res);
> > -
> > -            rc =3D sd=5Fbus=5Fcall=5Fmethod(bus1,            // On the=
 System
Bus
> > -                                    app,            // Service to
contact
> > -                                    obj,            // Object path
> > -                                    ifc,            // Interface name
> > -                                    "DelAddress4",  // Method to be
called
> > -                                    &err,           // object to
> return error
> > -                                    &res,           // Response
> message on success
> > -                                    "ssss",         // input
> message (dev,ip,nm,gw)
> > -                                    "eth0",
> > -                                    cur=5Fipaddr,
> > -                                    cur=5Fnetmask,
> > -                                    cur=5Fgateway);
> > +            r =3D sd=5Fbus=5Fcall=5Fmethod(bus,           // On the Sy=
stem Bus
> > +                                   app,            // Service to
contact
> > +                                   obj,            // Object path
> > +                                   ifc,            // Interface name
> > +                                   "DelAddress4",  // Method to be
called
> > +                                   &error,         // object to
> return error
> > +                                   &reply,         // Response
> message on success
> > +                                   "ssss",         // input
> message (dev,ip,nm,gw)
> > +                                   "eth0",
> > +                                   cur=5Fipaddr,
> > +                                   cur=5Fnetmask,
> > +                                   cur=5Fgateway);
> >          }
> >
> > -        if(rc < 0)
> > +        if(r < 0)
> >          {
> > -            fprintf(stderr, "Failed to remove existing IP %s: %s
> \n", cur=5Fipaddr, err.message);
> > -            return -1;
> > +            fprintf(stderr, "Failed to remove existing IP %s: %s
> \n", cur=5Fipaddr, error.message);
> > +            goto finish;
> >          }
> >
> > -        sd=5Fbus=5Ferror=5Ffree(&err);
> > -        sd=5Fbus=5Fmessage=5Funref(req);
> > -        sd=5Fbus=5Fmessage=5Funref(res);
> > -
> > -        rc =3D sd=5Fbus=5Fcall=5Fmethod(bus1,            // On the Sys=
tem Bus
> > -                                app,            // Service to contact
> > -                                obj,            // Object path
> > -                                ifc,            // Interface name
> > -                                "AddAddress4",  // Method to be called
> > -                                &err,           // object to return
error
> > -                                &res,           // Response
> message on success
> > -                                "ssss",         // input message
> (dev,ip,nm,gw)
> > -                                "eth0",
> > -                                new=5Fipaddr,
> > -                                new=5Fnetmask,
> > -                                new=5Fgateway);
> > -        if(rc < 0)
> > +        sd=5Fbus=5Ferror=5Ffree(&error);
> > +        reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> > +
> > +        r =3D sd=5Fbus=5Fcall=5Fmethod(bus,            // On the Syste=
m Bus
> > +                               app,            // Service to contact
> > +                               obj,            // Object path
> > +                               ifc,            // Interface name
> > +                               "AddAddress4",  // Method to be called
> > +                               &error,         // object to return
error
> > +                               &reply,         // Response
> message on success
> > +                               "ssss",         // input message
> (dev,ip,nm,gw)
> > +                               "eth0",
> > +                               new=5Fipaddr,
> > +                               new=5Fnetmask,
> > +                               new=5Fgateway);
> > +        if(r < 0)
> >          {
> > -            fprintf(stderr, "Failed to set IP %s: %s\n",
> new=5Fipaddr, err.message);
> > -            return -1;
> > +            fprintf(stderr, "Failed to set IP %s: %s\n",
> new=5Fipaddr, error.message);
> > +        }
> > +        else
> > +        {
> > +            strcpy (cur=5Fipaddr, new=5Fipaddr);
> > +            strcpy (cur=5Fnetmask, new=5Fnetmask);
> > +            strcpy (cur=5Fgateway, new=5Fgateway);
> >          }
> > -
> > -        strcpy (cur=5Fipaddr, new=5Fipaddr);
> > -        strcpy (cur=5Fnetmask, new=5Fnetmask);
> > -        strcpy (cur=5Fgateway, new=5Fgateway);
> >      }
> >      else
> >      {
> >          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->
parameter);
> > -        return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;
> > +        rc =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;
> >      }
> >
> > -    return rc;
> > +finish:
> > +    // Clenaup the resources allocated reply and error
> > +    sd=5Fbus=5Ferror=5Ffree(&error);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> > +
> > +    return (r < 0) ? -1 : rc;
> >  }
> >
> >  struct get=5Flan=5Ft {
> > @@ -206,7 +184,7 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fget=5Flan(ipmi=5F=
netfn=5Ft
> netfn, ipmi=5Fcmd=5Ft cmd,
> >      ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
> >      *data=5Flen =3D 0;
> >      sd=5Fbus *bus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();
> > -    sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;
> > +    sd=5Fbus=5Fmessage *reply =3D NULL;
> >      sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> >      int r =3D 0;
> >      const uint8=5Ft current=5Frevision =3D 0x11; // Current rev per IP=
MI
Spec 2.0
> > @@ -259,32 +237,27 @@ ipmi=5Fret=5Ft
> ipmi=5Ftransport=5Fget=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> >          const char*         device             =3D "eth0";
> >          uint8=5Ft buf[5]; // Size of expected IPMI response msg
> >
> > -        r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m,app,obj,ifc,"GetAddress4"=
);
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to add method object: %s\n",
> strerror(-r));
> > -            return -1;
> > -        }
> > -        r =3D sd=5Fbus=5Fmessage=5Fappend(m, "s", device);
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to append message data: %s
> \n", strerror(-r));
> > -            return -1;
> > -        }
> > -        r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > -        if (r < 0) {
> > +        r =3D sd=5Fbus=5Fcall=5Fmethod(bus,app,obj,ifc,"GetAddress4",
> > +                               &error, &reply, "s", device);
> > +        if (r < 0)
> > +        {
> >              fprintf(stderr, "Failed to call method: %s\n", strerror
(-r));
> > -            return -1;
> > +            rc =3D -1;
> > +            goto finish;
> >          }
> > -        rc =3D sd=5Fbus=5Fmessage=5Fenter=5Fcontainer (reply, 'a', "(i=
yyus)");
> > -        if(rc < 0)
> > +        r =3D sd=5Fbus=5Fmessage=5Fenter=5Fcontainer (reply, 'a', "(iy=
yus)");
> > +        if(r < 0)
> >          {
> >              fprintf(stderr, "Failed to parse response message:
> [%s]\n", strerror(-rc));
> > -            return -1;
> > +            rc =3D -1;
> > +            goto finish;
> >          }
> > -        rc =3D sd=5Fbus=5Fmessage=5Fread(reply, "(iyyus)", &family,
> &prefixlen, &scope, &flags, &saddr);
> > -        if (rc < 0)
> > +        r =3D sd=5Fbus=5Fmessage=5Fread(reply, "(iyyus)", &family,
> &prefixlen, &scope, &flags, &saddr);
> > +        if (r < 0)
> >          {
> >              fprintf(stderr, "Failed to receive response: %s\n",
> strerror(-r));
> > -            return -1;
> > +            rc =3D -1;
> > +            goto finish;
> >          }
> >
> >          printf("%s:%d:%d:%d:%s\n", family=3D=3DAF=5FINET?"IPv4":"IPv6",
> prefixlen, scope, flags, saddr);
> > @@ -297,7 +270,8 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fget=5Flan(ipmi=5F=
netfn=5Ft
> netfn, ipmi=5Fcmd=5Ft cmd,
> >          if (digit =3D=3D NULL)
> >          {
> >              fprintf(stderr, "Unexpected IP format: %s", saddr);
> > -            return IPMI=5FCC=5FRESPONSE=5FERROR;
> > +            rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;
> > +            goto finish;
> >          }
> >          i =3D 0;
> >          while (digit !=3D NULL)
> > @@ -311,7 +285,7 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fget=5Flan(ipmi=5F=
netfn=5Ft
> netfn, ipmi=5Fcmd=5Ft cmd,
> >          *data=5Flen =3D sizeof(buf);
> >          memcpy(response, &buf, *data=5Flen);
> >
> > -        return IPMI=5FCC=5FOK;
> > +        rc =3D IPMI=5FCC=5FOK;
> >      }
> >      else if (reqptr->parameter =3D=3D LAN=5FPARM=5FMAC)
> >      {
> > @@ -321,30 +295,26 @@ ipmi=5Fret=5Ft
> ipmi=5Ftransport=5Fget=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> >          uint8=5Ft             buf[7];
> >          char *eaddr1 =3D NULL;
> >
> > -        r =3D
> sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m,app,obj,ifc,"GetHwAddress=
");
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to add method object: %s\n",
> strerror(-r));
> > -            return -1;
> > -        }
> > -        r =3D sd=5Fbus=5Fmessage=5Fappend(m, "s", device);
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to append message data: %s
> \n", strerror(-r));
> > -            return -1;
> > -        }
> > -        r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> > -        if (r < 0) {
> > -            fprintf(stderr, "Failed to call method: %s\n", strerror
(-r));
> > -            return -1;
> > +        r =3D sd=5Fbus=5Fcall=5Fmethod(bus,app,obj,ifc,"GetHwAddress",
> > +                               &error, &reply, "s", device);
> > +        if (r < 0)
> > +        {
> > +            fprintf(stderr, "Failed to call GetHwAddress: %s\n",
> strerror(-r));
> > +            rc =3D -1;
> > +            goto finish;
> >          }
> >          r =3D sd=5Fbus=5Fmessage=5Fread(reply, "s", &eaddr1);
> > -        if (r < 0) {
> > +        if (r < 0)
> > +        {
> >              fprintf(stderr, "Failed to get a response: %s", strerror
(-r));
> > -            return IPMI=5FCC=5FRESPONSE=5FERROR;
> > +            rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;
> > +            goto finish;
> >          }
> >          if (eaddr1 =3D=3D NULL)
> >          {
> >              fprintf(stderr, "Failed to get a valid response: %s",
> strerror(-r));
> > -            return IPMI=5FCC=5FRESPONSE=5FERROR;
> > +            rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;
> > +            goto finish;
> >          }
> >
> >          memcpy((void*)&buf[0], &current=5Frevision, 1);
> > @@ -354,7 +324,8 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fget=5Flan(ipmi=5F=
netfn=5Ft
> netfn, ipmi=5Fcmd=5Ft cmd,
> >          if (digit =3D=3D NULL)
> >          {
> >              fprintf(stderr, "Unexpected MAC format: %s", eaddr1);
> > -            return IPMI=5FCC=5FRESPONSE=5FERROR;
> > +            rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;
> > +            goto finish;
> >          }
> >
> >          i=3D0;
> > @@ -369,14 +340,18 @@ ipmi=5Fret=5Ft
> ipmi=5Ftransport=5Fget=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> >          *data=5Flen =3D sizeof(buf);
> >          memcpy(response, &buf, *data=5Flen);
> >
> > -        return IPMI=5FCC=5FOK;
> > +        rc =3D IPMI=5FCC=5FOK;
> >      }
> >      else
> >      {
> >          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->
parameter);
> > -        return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;
> > +        rc =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;
> >      }
> >
> > +finish:
> > +    sd=5Fbus=5Ferror=5Ffree(&error);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> > +
> >      return rc;
> >  }
> >
>

--0__=EABBF5E2DF8E56DE8f9e8a93df938690918cEABBF5E2DF8E56DE
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body><p>Thanks for the comments.. I responded inline.<br><br>Thanks<=
br><br>--------------------------------------------------------------------=
-----------------<br>Thanks and Regards,<br>Vishwanath.<br>Advisory Softwar=
e Engineer,<br>Power Firmware Development, <br>Systems &amp;Technology Lab,=
<br>MG2-6F-255 , Manyata Embassy Business Park, <br>Bangalore , KA , 560045=
<br>Ph: +91-80-46678255<br>E-mail: vishwanath@in.ibm.com<br>---------------=
-------------------------------------------------------------------<br><br>=
<tt>Cyril Bur &lt;cyrilbur@gmail.com&gt; wrote on 09/03/2016 04:54:11 am:<b=
r><br>&gt; From: Cyril Bur &lt;cyrilbur@gmail.com&gt;</tt><br><tt>&gt; To: =
Vishwanatha Subbanna/India/IBM@IBMIN</tt><br><tt>&gt; Cc: OpenBMC Patches &=
lt;openbmc-patches@stwcx.xyz&gt;, openbmc@lists.ozlabs.org</tt><br><tt>&gt;=
 Date: 09/03/2016 04:54 am</tt><br><tt>&gt; Subject: Re: [PATCH phosphor-ho=
st-ipmid v4] memory leak found during<br>&gt; multiple reboots. it was foun=
d that in many cases the reply was not unref'ed</tt><br><tt>&gt; <br>&gt; O=
n Wed, &nbsp;2 Mar 2016 00:40:28 -0600<br>&gt; OpenBMC Patches &lt;openbmc-=
patches@stwcx.xyz&gt; wrote:<br>&gt; <br>&gt; &gt; From: vishwa &lt;vishwan=
ath@in.ibm.com&gt;<br>&gt; &gt; <br>&gt; &gt; --signed off by vishwanath@in=
.ibm.com---<br>&gt; &gt; ---<br>&gt; &gt; &nbsp;apphandler.C &nbsp; &nbsp; =
&nbsp; | 150 ++++++++++++++++++----------------------<br>&gt; &gt; &nbsp;ho=
st-services.c &nbsp; &nbsp;| &nbsp; 2 +-<br>&gt; &gt; &nbsp;ipmid.C &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;53 +++++++-------<br>&gt; &gt; &n=
bsp;sensorhandler.C &nbsp; &nbsp;| &nbsp; 2 +-<br>&gt; &gt; &nbsp;storagead=
dsel.C &nbsp; &nbsp;| &nbsp; 4 +-<br>&gt; &gt; &nbsp;transporthandler.C | 1=
99 ++++++++++++++++++++++<br>&gt; +------------------------------<br>&gt; &=
gt; &nbsp;6 files changed, 182 insertions(+), 228 deletions(-)<br>&gt; &gt;=
 <br>&gt; &gt; diff --git a/apphandler.C b/apphandler.C<br>&gt; &gt; index =
a48059f..a921643 100644<br>&gt; &gt; --- a/apphandler.C<br>&gt; &gt; +++ b/=
apphandler.C<br>&gt; &gt; @@ -119,11 +119,22 @@ ipmi=5Fret=5Ft <br>&gt; ipm=
i=5Fapp=5Fget=5Fdevice=5Fguid(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<b=
r>&gt; &gt; &nbsp; &nbsp; &nbsp;const char &nbsp;*objname =3D &quot;/org/op=
enbmc/control/chassis0&quot;;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;const char &=
nbsp;*iface =3D &quot;org.freedesktop.DBus.Properties&quot;;<br>&gt; &gt; &=
nbsp; &nbsp; &nbsp;const char &nbsp;*chassis=5Fiface =3D &quot;org.openbmc.=
control.Chassis&quot;;<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage *repl=
y =3D NULL, *m =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *re=
ply =3D NULL;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D S=
D=5FBUS=5FERROR=5FNULL;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;int r =3D 0;<br>&g=
t; &gt; &nbsp; &nbsp; &nbsp;char *uuid =3D NULL;<br>&gt; &gt; &nbsp;<br>&gt=
; &gt; + &nbsp; &nbsp;// UUID is in RFC4122 format. Ex: 61a39523-78f2-11e5-=
9862-e6402cfc3223<br>&gt; &gt; + &nbsp; &nbsp;// Per IPMI Spec 2.0 need to =
convert to 16 hex bytes and <br>&gt; reverse the byte order<br>&gt; &gt; + =
&nbsp; &nbsp;// Ex: 0x2332fc2c40e66298e511f2782395a361<br>&gt; &gt; +<br>&g=
t; &gt; + &nbsp; &nbsp;const int resp=5Fsize =3D 16; // Response is 16 hex =
bytes per IPMI Spec<br>&gt; &gt; + &nbsp; &nbsp;uint8=5Ft resp=5Fuuid[resp=
=5Fsize]; // Array to hold the formatted response<br>&gt; &gt; + &nbsp; &nb=
sp;int resp=5Floc =3D resp=5Fsize-1; // Point resp end of array to <br>&gt;=
 save in reverse order<br>&gt; &gt; + &nbsp; &nbsp;int i =3D 0;<br>&gt; &gt=
; + &nbsp; &nbsp;char *tokptr =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;char *i=
d=5Foctet =3D NULL;<br>&gt; &gt; +<br>&gt; &gt; &nbsp; &nbsp; &nbsp;// Stat=
us code.<br>&gt; &gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=
=5FOK;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; &gt; @@ =
-131,49 +142,33 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Fapp=5Fget=5Fdevice=5Fguid=
(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &nbsp; &nb=
sp;printf(&quot;IPMI GET DEVICE GUID\n&quot;);<br>&gt; &gt; &nbsp;<br>&gt; =
&gt; &nbsp; &nbsp; &nbsp;// Call Get properties method with the interface a=
nd property name<br>&gt; &gt; - &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fnew=
=5Fmethod=5Fcall(bus,&amp;m,busname,objname,iface,&quot;Get&quot;);<br>&gt;=
 &gt; - &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &n=
bsp;fprintf(stderr, &quot;Failed to add the Get method object: %s<br>&gt; \=
n&quot;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return IP=
MI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; &gt; - &nbsp; &nbsp;}<br>&gt; &gt; -=
 &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(m, &quot;ss&quot;, chassis=
=5Fiface, &quot;uuid&quot;);<br>&gt; &gt; - &nbsp; &nbsp;if (r &lt; 0) {<br=
>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to app=
end arguments: %s\n&quot;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbs=
p; &nbsp;return -1;<br>&gt; &gt; - &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nb=
sp;r =3D sd=5Fbus=5Fcall(bus, m, 0, &amp;error, &amp;reply);<br>&gt; &gt; -=
 &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;fpr=
intf(stderr, &quot;Failed to call the Get method: %s\n&quot;, <br>&gt; stre=
rror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FUNS=
PECIFIED=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmetho=
d(bus,busname,objname,iface,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Get&quot;=
,&amp;error, &amp;reply, &quot;ss&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cha=
ssis=5Fiface, &quot;uuid&quot;);<br>&gt; &gt; + &nbsp; &nbsp;if (r &lt; 0)<=
br>&gt; &gt; + &nbsp; &nbsp;{<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fpr=
intf(stderr, &quot;Failed to call Get Method: %s\n&quot;, strerror(-r));<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FUNSPECIFIED=5FER=
ROR;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &n=
bsp; &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; <br>&gt; The above looks like a =
rework, not really addressing a memory leak<br>&gt; specifically? The rewor=
k looks good to me but can we please start splitting<br>&gt; patches up and=
 do what the commit message says in each patch.<br>&gt; <br>&gt; This serie=
s would have been better with (at least) the above being in one<br>&gt; com=
mit entitled something like &quot;Rework ipmi=5Fapp=5Fget=5Fdevice=5Fguid()=
 dbud message<br>&gt; handling&quot; and then an explanation as to why this=
 way is better.<br>&gt; </tt><br><br><tt>Okay... I had 2 approaches in fron=
t of me. Handle memory leak in the old way first and then in the next patch=
, undo what I had done before and do it using new API and handle the leak a=
lso in the new approach. I am not totally agreeing on this since there is a=
 do-undo-redo effort involved here. BTW, is doing a code rework also not a =
method to fix the leaks if we had some issues in the way it was before ?</t=
t><br><tt><br>&gt; &gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fread=
(reply, &quot;v&quot;, &quot;s&quot;, &amp;uuid);<br>&gt; &gt; - &nbsp; &nb=
sp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr=
, &quot;Failed to get a response: %s&quot;, strerror(-r));<br>&gt; &gt; - &=
nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt;=
 - &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp;if (uuid =3D=3D NULL)<br>&gt;=
 &gt; + &nbsp; &nbsp;if (r &lt; 0 || uuid =3D=3D NULL)<br>&gt; &gt; &nbsp; =
&nbsp; &nbsp;{<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &q=
uot;Failed to get a valid response: %s&quot;, <br>&gt; strerror(-r));<br>&g=
t; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FRESPONSE=5FERROR;<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to ge=
t a response: %s&quot;, strerror(-r));<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbs=
p;<br>&gt; &gt; - &nbsp; &nbsp;// UUID is in RFC4122 format. Ex: 61a39523-7=
8f2-11e5-9862-e6402cfc3223<br>&gt; &gt; - &nbsp; &nbsp;// Per IPMI Spec 2.0=
 need to convert to 16 hex bytes and <br>&gt; reverse the byte order<br>&gt=
; &gt; - &nbsp; &nbsp;// Ex: 0x2332fc2c40e66298e511f2782395a361<br>&gt; &gt=
; -<br>&gt; &gt; - &nbsp; &nbsp;const int resp=5Fsize =3D 16; // Response i=
s 16 hex bytes per IPMI Spec<br>&gt; &gt; - &nbsp; &nbsp;uint8=5Ft resp=5Fu=
uid[resp=5Fsize]; // Array to hold the formatted response<br>&gt; &gt; - &n=
bsp; &nbsp;int resp=5Floc =3D resp=5Fsize-1; // Point resp end of array to =
<br>&gt; save in reverse order<br>&gt; &gt; - &nbsp; &nbsp;int i =3D 0;<br>=
&gt; &gt; - &nbsp; &nbsp;char *tokptr =3D NULL;<br>&gt; &gt; -<br>&gt; &gt;=
 &nbsp; &nbsp; &nbsp;// Traverse the UUID<br>&gt; &gt; - &nbsp; &nbsp;char*=
 id=5Foctet =3D strtok=5Fr(uuid, &quot;-&quot;, &amp;tokptr); // Get the <b=
r>&gt; UUID octects separated by dash<br>&gt; &gt; + &nbsp; &nbsp;id=5Focte=
t =3D strtok=5Fr(uuid, &quot;-&quot;, &amp;tokptr); // Get the UUID <br>&gt=
; octects separated by dash<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp;if (id=5Foctet =3D=3D NULL)<br>&gt; &gt; - &nbsp; &nbsp;{ // Error<br=
>&gt; &gt; + &nbsp; &nbsp;{<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Er=
ror<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Un=
expected UUID format: %s&quot;, uuid);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; =
&nbsp;return IPMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; =
&nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;while (id=5Foctet !=3D NULL)<br>&gt=
; &gt; @@ -201,8 +196,9 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Fapp=5Fget=5Fdevic=
e=5Fguid(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &n=
bsp; &nbsp;// Pack the actual response<br>&gt; &gt; &nbsp; &nbsp; &nbsp;mem=
cpy(response, &amp;resp=5Fuuid, *data=5Flen);<br>&gt; &gt; &nbsp;<br>&gt; &=
gt; +finish:<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;=
error);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&gt; =
&gt; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt; &g=
t; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; &nbsp;}<=
br>&gt; &gt; @@ -246,15 +242,13 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Fapp=5Fset=
=5Fwatchdog(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp;=
 &nbsp; &nbsp;const char &nbsp;*busname =3D &quot;org.openbmc.watchdog.Host=
&quot;;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;const char &nbsp;*objname =3D &quo=
t;/org/openbmc/watchdog/host0&quot;;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;const=
 char &nbsp;*iface =3D &quot;org.openbmc.Watchdog&quot;;<br>&gt; &gt; - &nb=
sp; &nbsp;sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;<br>&gt; &gt; + &=
nbsp; &nbsp;sd=5Fbus=5Fmessage *reply =3D NULL;<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &gt; &nbs=
p; &nbsp; &nbsp;int r =3D 0;<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp;=
 &nbsp;set=5Fwd=5Fdata=5Ft *reqptr =3D (set=5Fwd=5Fdata=5Ft*) request;<br>&=
gt; &gt; &nbsp; &nbsp; &nbsp;uint16=5Ft timer =3D 0;<br>&gt; &gt; &nbsp; &n=
bsp; &nbsp;uint32=5Ft timer=5Fms =3D 0;<br>&gt; &gt; - &nbsp; &nbsp;// Stat=
us code.<br>&gt; &gt; - &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<=
br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>=
&gt; &gt; &nbsp;<br>&gt; &gt; @@ -266,53 +260,45 @@ ipmi=5Fret=5Ft <br>&gt;=
 ipmi=5Fapp=5Fset=5Fwatchdog(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br=
>&gt; &gt; &nbsp; &nbsp; &nbsp;printf(&quot;WATCHDOG SET Timer:[0x%X] 100ms=
 intervals\n&quot;,timer);<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &=
nbsp;// Set watchdog timer<br>&gt; &gt; - &nbsp; &nbsp;r =3D sd=5Fbus=5Fmes=
sage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,busname,objname,iface,&quot;set&quot;=
);<br>&gt; &gt; - &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp;=
 &nbsp; &nbsp;fprintf(stderr, &quot;Failed to add the set method object: %s=
<br>&gt; \n&quot;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp=
;return -1;<br>&gt; &gt; - &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp;r =3D=
 sd=5Fbus=5Fmessage=5Fappend(m, &quot;i&quot;, timer=5Fms);<br>&gt; &gt; - =
&nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;fpri=
ntf(stderr, &quot;Failed to add timer value: %s\n&quot;, strerror(-r));<br>=
&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; - &nbsp; &nb=
sp;}<br>&gt; &gt; - &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall(bus, m, 0, &amp;erro=
r, &amp;reply);<br>&gt; &gt; - &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - =
&nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to call the set met=
hod: %s\n&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp=
; &nbsp;return -1;<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmeth=
od(bus, busname, objname, iface,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;set&q=
uot;, &amp;error, &amp;reply, &quot;i&quot;, timer=5Fms);<br>&gt; &gt; + &n=
bsp; &nbsp;if(r &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp;{<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to call the SET method: %=
s\n&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&g=
t; &gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; &gt; + =
&nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt; &gt; +<br=
>&gt; <br>&gt; So here you're sort of reworking AND fixing the leaks.<br>&g=
t; In terms of fixing the leaks can't you just pass NULL instead of <br>&gt=
; reply? I could<br>&gt; be wrong here but I believe that sd=5Fbus will han=
dle passing NULL and realise<br>&gt; that you don't care about the reply (w=
hich, AFAICT, you don't).<br>&gt; </tt><br><br><tt>Sorry but I don't unders=
tand &quot;Pass the NULL instead of reply&quot;. Pass the NULL where ?. </t=
t><br><tt>The way its done here is per one of the approaches followed in sy=
stemd code and I followed the same.</tt><br><tt>I may have not consumed the=
 reply here but just thinking futuristic to avoid any dangling pointer issu=
es if they were to be re used.</tt><br><br><tt>from sd-bus/bus-message.C</t=
t><br><tt>---------------------------</tt><br><br><tt>=5Fpublic=5F sd=5Fbus=
=5Fmessage* sd=5Fbus=5Fmessage=5Funref(sd=5Fbus=5Fmessage *m) {</tt><br><br=
><tt>&nbsp; &nbsp; &nbsp; &nbsp; if (!m)</tt><br><tt>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return NULL;</tt><br><br><tt>&nbsp; &nbsp=
; &nbsp; &nbsp; assert(m-&gt;n=5Fref &gt; 0);</tt><br><tt>&nbsp; &nbsp; &nb=
sp; &nbsp; m-&gt;n=5Fref--;</tt><br><br><tt>&nbsp; &nbsp; &nbsp; &nbsp; if =
(m-&gt;n=5Fref &gt; 0)</tt><br><tt>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; return NULL;</tt><br><br><tt>&nbsp; &nbsp; &nbsp; &nbsp; me=
ssage=5Ffree(m);</tt><br><tt>&nbsp; &nbsp; &nbsp; &nbsp; return NULL;</tt><=
br><tt>}</tt><br><br><tt><br>&gt; &gt; &nbsp; &nbsp; &nbsp;// Stop the curr=
ent watchdog if any<br>&gt; &gt; - &nbsp; &nbsp;r =3D <br>&gt; sd=5Fbus=5Fm=
essage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,busname,objname,iface,&quot;stop&qu=
ot;);<br>&gt; &gt; - &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nb=
sp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to add the start method objec=
t: <br>&gt; %s\n&quot;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; =
&nbsp;return -1;<br>&gt; &gt; - &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp;=
r =3D sd=5Fbus=5Fcall(bus, m, 0, &amp;error, &amp;reply);<br>&gt; &gt; - &n=
bsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;fprint=
f(stderr, &quot;Failed to call the start method: %s\n&quot;, <br>&gt; strer=
ror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt;=
 + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus, busname, objname, iface=
,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;stop&quot;, &amp;error, &amp;reply, =
NULL);<br>&gt; &gt; + &nbsp; &nbsp;if(r &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp=
;{<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed t=
o call the STOP method: %s\n&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<=
br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp;// Start the watchdog if re=
quested<br>&gt; &gt; &nbsp; &nbsp; &nbsp;if (reqptr-&gt;t=5Fuse &amp; 0x40)=
<br>&gt; &gt; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nb=
sp;r =3D <br>&gt; sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,busna=
me,objname,iface,&quot;start&quot;);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &n=
bsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;fprintf(stderr, &quot;Failed to add the start method <br>&gt; object: %s\n=
&quot;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;return -1;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; - &=
nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall(bus, m, 0, &amp;error, &amp=
;reply);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; =
&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Faile=
d to call the start method: %s<br>&gt; \n&quot;, strerror(-r));<br>&gt; &gt=
; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);<br>=
&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Start the watchdog=
 if requested<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fca=
ll=5Fmethod(bus, busname, objname, iface,<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &quot;start&quot;, &amp;error, &amp;reply, NULL);<br>&gt; &gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp;if(r &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;{<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(=
stderr, &quot;Failed to call the START method: %s<br>&gt; \n&quot;, strerro=
r(-r));<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp=
; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; +finish:<br>&gt; &gt; &nb=
sp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; &gt; - &nbsp;=
 &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&gt; &gt; + &nbsp; &nbsp;reply =3D=
 sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbs=
p; &nbsp;return rc;<br>&gt; &gt; + &nbsp; &nbsp;return (r &lt; 0) ? -1 : IP=
MI=5FCC=5FOK;<br>&gt; &gt; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;<=
br>&gt; &gt; @@ -323,7 +309,7 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Fapp=5Freset=
=5Fwatchdog(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp;=
 &nbsp; &nbsp;const char &nbsp;*busname =3D &quot;org.openbmc.watchdog.Host=
&quot;;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;const char &nbsp;*objname =3D &quo=
t;/org/openbmc/watchdog/host0&quot;;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;const=
 char &nbsp;*iface =3D &quot;org.openbmc.Watchdog&quot;;<br>&gt; &gt; - &nb=
sp; &nbsp;sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;<br>&gt; &gt; + &=
nbsp; &nbsp;sd=5Fbus=5Fmessage *reply =3D NULL;<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &gt; &nbs=
p; &nbsp; &nbsp;int r =3D 0;<br>&gt; &gt; &nbsp;<br>&gt; &gt; @@ -334,19 +3=
20,15 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Fapp=5Freset=5Fwatchdog(ipmi=5Fnetfn=
=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &nbsp; &nbsp;printf(&qu=
ot;WATCHDOG RESET\n&quot;);<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp;// Refresh watchdog<br>&gt; &gt; - &nbsp; &nbsp;r =3D <br>&gt; sd=5Fb=
us=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,busname,objname,iface,&quot;p=
oke&quot;);<br>&gt; &gt; - &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbs=
p; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to add the method objec=
t: %s\n&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; =
&nbsp;return -1;<br>&gt; &gt; - &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp;=
r =3D sd=5Fbus=5Fcall(bus, m, 0, &amp;error, &amp;reply);<br>&gt; &gt; + &n=
bsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus, busname, objname, iface,<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &quot;poke&quot;, &amp;error, &amp;reply, NULL)=
;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &n=
bsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to call the method: %s\n&quo=
t;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to add =
reset &nbsp;watchdog: %s\n&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;rc =3D -1;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&=
gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&a=
mp;error);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&g=
t; &gt; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt;=
 &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; &nbsp=
;}<br>&gt; &gt; diff --git a/host-services.c b/host-services.c<br>&gt; &gt;=
 index 23aa55e..cc47439 100644<br>&gt; &gt; --- a/host-services.c<br>&gt; &=
gt; +++ b/host-services.c<br>&gt; &gt; @@ -68,7 +68,7 @@ static int soft=5F=
power=5Foff(sd=5Fbus=5Fmessage *m, <br>&gt; void *userdata, sd=5Fbus=5Ferro=
r *ret=5Fe<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;finish:<br>&gt; &gt; &nbs=
p; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;bus=5Ferror);<br>&gt; &gt; - &=
nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(response);<br>&gt; &gt; + &nbsp; &nb=
sp;response =3D sd=5Fbus=5Fmessage=5Funref(response);<br>&gt; &gt; &nbsp;<b=
r>&gt; &gt; &nbsp; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; &gt; &nbsp; &nbsp; &n=
bsp;{<br>&gt; &gt; diff --git a/ipmid.C b/ipmid.C<br>&gt; &gt; index 0f4139=
c..06fbf05 100644<br>&gt; &gt; --- a/ipmid.C<br>&gt; &gt; +++ b/ipmid.C<br>=
&gt; &gt; @@ -225,9 +225,8 @@ static int send=5Fipmi=5Fmessage(sd=5Fbus=5Fm=
essage <br>&gt; *req, unsigned char seq, unsigned ch<br>&gt; &gt; &nbsp;<br=
>&gt; &gt; &nbsp;final:<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=
=5Ffree(&amp;error);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref=
(m);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt;=
 &gt; -<br>&gt; &gt; + &nbsp; &nbsp;m =3D sd=5Fbus=5Fmessage=5Funref(m);<br=
>&gt; &gt; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);<br>&=
gt; <br>&gt; Why this change? You don't check m or reply/... &nbsp;the unre=
f already <br>&gt; happens. The<br>&gt; only thing I can think that you're =
doing is fixing warnings (in which case,<br>&gt; separate patch and please =
say so) but quite frankly you shouldn't be enabling<br>&gt; those warnings,=
 they're a pain.<br>&gt; </tt><br><br><tt>I agree I am not consuming it her=
e / passing the pointer back.. but it was more of a good practise that I wa=
s following.</tt><br><tt>I am not sure which warning are you saying is a pa=
in ?. Do you have an example ? -or- are you generally saying</tt><br><tt>co=
mpiler should not warn for these types of message usages ?.</tt><br><br><tt=
>BTW, I did not fix any warnings.. That code was just being futuristic.</tt=
><br><tt><br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return r &lt=
; 0 ? EXIT=5FFAILURE : EXIT=5FSUCCESS;<br>&gt; &gt; &nbsp;}<br>&gt; &gt; @@=
 -246,13 +245,13 @@ static int <br>&gt; handle=5Fipmi=5Fcommand(sd=5Fbus=5F=
message *m, void *user=5Fdata, sd=5Fbus=5Ferror<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp;r =3D sd=5Fbus=5Fmessage=5Fread(m, &quot;yyyy&quot;, &nbsp;&amp;seque=
nce, &amp;netfn, &amp;lun, &amp;cmd);<br>&gt; &gt; &nbsp; &nbsp; &nbsp;if (=
r &lt; 0) {<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, =
&quot;Failed to parse signal message: %s\n&quot;, <br>&gt; strerror(-r));<b=
r>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp; &nbsp;goto final;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &=
gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fread=
=5Farray(m, 'y', &nbsp;&amp;request, &amp;sz );<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp;if (r &lt; 0) {<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprint=
f(stderr, &quot;Failed to parse signal message: %s\n&quot;, <br>&gt; strerr=
or(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp;goto final;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}=
<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;fprintf(ipmiio, &quot=
;IPMI Incoming: Seq 0x%02x, NetFn 0x%02x, <br>&gt; CMD: 0x%02x \n&quot;, se=
quence, netfn, cmd);<br>&gt; &gt; @@ -268,6 +267,7 @@ static int handle=5Fi=
pmi=5Fcommand(sd=5Fbus=5Fmessage <br>&gt; *m, void *user=5Fdata, sd=5Fbus=
=5Ferror<br>&gt; &gt; &nbsp; &nbsp; &nbsp;if(r !=3D 0)<br>&gt; &gt; &nbsp; =
&nbsp; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stder=
r,&quot;ERROR:[0x%X] handling NetFn:[0x%X], Cmd:<br>&gt; [0x%X]\n&quot;,r, =
netfn, cmd);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto final;<br>&gt; =
&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &=
nbsp;fprintf(ipmiio, &quot;IPMI Response:\n&quot;);<br>&gt; &gt; @@ -278,11=
 +278,12 @@ static int <br>&gt; handle=5Fipmi=5Fcommand(sd=5Fbus=5Fmessage =
*m, void *user=5Fdata, sd=5Fbus=5Ferror<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;((unsigned char *)response) + 1, resplen - 1);<br>&gt; &=
gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;fprintf(stderr, &quot;Failed to send the response message\n&quo=
t;);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; &nbs=
p; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; +final:<br>&gt; &gt; + &=
nbsp; &nbsp;m =3D sd=5Fbus=5Fmessage=5Funref(m);<br>&gt; &gt; &nbsp;<br>&gt=
; &gt; - &nbsp; &nbsp;return 0;<br>&gt; &gt; + &nbsp; &nbsp;return (r &lt; =
0) ? -1 : 0;<br>&gt; &gt; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;<b=
r>&gt; &gt; @@ -470,6 +471,7 @@ int <br>&gt; find=5Finterface=5Fproperty=5F=
fru=5Ftype(dbus=5Finterface=5Ft *interface, const char *pr<br>&gt; &gt; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to create a met=
hod call: %s&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;fprintf(stderr,&quot;Bus: %s Path: %s Interface: %s \n&quot=
;,<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;interface-&gt;bus, interface-&gt;path, interface-&gt;interface);<br>&gt;=
 &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto final;<br>&gt; &gt; &nbsp; &nbsp; &=
nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fmessage=5Fappend(m, &quot;ss&quot;, <br>&gt; &quot;org.openbmc.Inventory=
Item&quot;, property=5Fname);<br>&gt; &gt; @@ -477,6 +479,7 @@ int <br>&gt;=
 find=5Finterface=5Fproperty=5Ffru=5Ftype(dbus=5Finterface=5Ft *interface, =
const char *pr<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stder=
r, &quot;Failed to create a input parameter: %s&quot;,<br>&gt; strerror(-r)=
);<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr,&quot;Bus:=
 %s Path: %s Interface: %s \n&quot;,<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;interface-&gt;bus, interface-&gt;path,=
 interface-&gt;interface);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto f=
inal;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &=
nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall(bus, m, 0, &amp;error, &amp;reply)=
;<br>&gt; &gt; @@ -496,7 +499,8 @@ int <br>&gt; find=5Finterface=5Fproperty=
=5Ffru=5Ftype(dbus=5Finterface=5Ft *interface, const char *pr<br>&gt; &gt; =
&nbsp;final:<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=
=5Ferror=5Ffree(&amp;error);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=
=5Funref(m);<br>&gt; &gt; + &nbsp; &nbsp;m =3D sd=5Fbus=5Fmessage=5Funref(m=
);<br>&gt; &gt; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);=
<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return r;<br>&gt; &gt=
; &nbsp;}<br>&gt; &gt; @@ -512,29 +516,18 @@ int find=5Fopenbmc=5Fpath(cons=
t char *type, <br>&gt; const uint8=5Ft num, dbus=5Finterface=5Ft *int<br>&g=
t; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;char &nbsp;*str1, *str2, *s=
tr3;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=
=5FERROR=5FNULL;<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage *reply =3D =
NULL, *m=3DNULL;<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *reply =3D =
NULL;<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &n=
bsp;int r;<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp;r =3D <br>&gt; s=
d=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,busname,objname,busname,=
&quot;getObjectFromByteId&quot;);<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbu=
s=5Fcall=5Fmethod(bus,busname,objname,busname, <br>&gt; &quot;getObjectFrom=
ByteId&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;error, &amp;reply, &quot;=
sy&quot;, type, num);<br>&gt; &gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&=
gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to =
create a method call: %s&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; - &nbs=
p; &nbsp;}<br>&gt; &gt; -<br>&gt; &gt; - &nbsp; &nbsp;r =3D sd=5Fbus=5Fmess=
age=5Fappend(m, &quot;sy&quot;, type, num);<br>&gt; &gt; - &nbsp; &nbsp;if =
(r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quo=
t;Failed to create a input parameter: %s&quot;,<br>&gt; strerror(-r));<br>&=
gt; &gt; - &nbsp; &nbsp;}<br>&gt; &gt; -<br>&gt; &gt; - &nbsp; &nbsp;// Cal=
l the IPMI responder on the bus so the message can be <br>&gt; sent to the =
CEC<br>&gt; &gt; - &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall(bus, m, 0, &amp;error=
, &amp;reply);<br>&gt; &gt; - &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &=
nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to call the method: =
%s&quot;, strerror(-r));<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;got=
o final;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt=
; -<br>&gt; &gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fread(reply,=
 &quot;(sss)&quot;, &amp;str1, &amp;str2, &amp;str3);<br>&gt; &gt; &nbsp; &=
nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
fprintf(stderr, &quot;Failed to get a response: %s&quot;, strerror(-r));<br=
>&gt; &gt; @@ -550,7 +543,7 @@ int find=5Fopenbmc=5Fpath(const char *type, =
const <br>&gt; uint8=5Ft num, dbus=5Finterface=5Ft *int<br>&gt; &gt; &nbsp;=
final:<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferro=
r=5Ffree(&amp;error);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funre=
f(m);<br>&gt; &gt; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(repl=
y);<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return r;<br>&gt; =
&gt; &nbsp;}<br>&gt; &gt; @@ -577,11 +570,13 @@ int set=5Fsensor=5Fdbus=5Fs=
tate=5Fs(uint8=5Ft number, <br>&gt; const char *method, const char *valu<br=
>&gt; &gt; &nbsp; &nbsp; &nbsp;r =3D <br>&gt; sd=5Fbus=5Fmessage=5Fnew=5Fme=
thod=5Fcall(bus,&amp;m,a.bus,a.path,a.interface,method);<br>&gt; &gt; &nbsp=
; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;fprintf(stderr, &quot;Failed to create a method call: %s&quot;, <br>&gt;=
 strerror(-r));<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto final;<br>&g=
t; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp=
; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(m, &quot;v&quot;, &quot;s&quot;, =
value);<br>&gt; &gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to create a input=
 parameter: %s&quot;,<br>&gt; strerror(-r));<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;goto final;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nb=
sp;<br>&gt; &gt; &nbsp;<br>&gt; &gt; @@ -590,9 +585,9 @@ int set=5Fsensor=
=5Fdbus=5Fstate=5Fs(uint8=5Ft number, <br>&gt; const char *method, const ch=
ar *valu<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &qu=
ot;Failed to call the method: %s&quot;, strerror(-r));<br>&gt; &gt; &nbsp; =
&nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; -<br>&gt; &gt; +final:<br>&=
gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; &=
gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&gt; &gt; + &nbsp; &nb=
sp;m =3D sd=5Fbus=5Fmessage=5Funref(m);<br>&gt; &gt; &nbsp;<br>&gt; &gt; &n=
bsp; &nbsp; &nbsp;return 0;<br>&gt; &gt; &nbsp;}<br>&gt; &gt; @@ -612,11 +6=
07,13 @@ int set=5Fsensor=5Fdbus=5Fstate=5Fy(uint8=5Ft number, <br>&gt; con=
st char *method, const uint8=5Ft va<br>&gt; &gt; &nbsp; &nbsp; &nbsp;r =3D =
<br>&gt; sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,a.bus,a.path,a=
.interface,method);<br>&gt; &gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt=
; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to cr=
eate a method call: %s&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;goto final;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt;=
 &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fap=
pend(m, &quot;v&quot;, &quot;y&quot;, value);<br>&gt; &gt; &nbsp; &nbsp; &n=
bsp;if (r &lt; 0) {<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(=
stderr, &quot;Failed to create a input parameter: %s&quot;,<br>&gt; strerro=
r(-r));<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto final;<br>&gt; &gt; =
&nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;<br>&gt; &gt; =
@@ -625,9 +622,9 @@ int set=5Fsensor=5Fdbus=5Fstate=5Fy(uint8=5Ft number, <=
br>&gt; const char *method, const uint8=5Ft va<br>&gt; &gt; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;12 Failed to call the method: %s&q=
uot;, strerror(-r));<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;=
<br>&gt; &gt; -<br>&gt; &gt; +final:<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5F=
bus=5Ferror=5Ffree(&amp;error);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmess=
age=5Funref(m);<br>&gt; &gt; + &nbsp; &nbsp;m =3D sd=5Fbus=5Fmessage=5Funre=
f(m);<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return 0;<br>&gt=
; &gt; -}<br>&gt; &gt; \ No newline at end of file<br>&gt; &gt; +}<br>&gt; =
&gt; diff --git a/sensorhandler.C b/sensorhandler.C<br>&gt; &gt; index d171=
bf5..90bfd0f 100644<br>&gt; &gt; --- a/sensorhandler.C<br>&gt; &gt; +++ b/s=
ensorhandler.C<br>&gt; &gt; @@ -221,7 +221,7 @@ ipmi=5Fret=5Ft <br>&gt; ipm=
i=5Fsen=5Fget=5Fsensor=5Freading(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd=
,<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp=
;<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt; &g=
t; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt; &gt;=
 &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; &nbsp;}<br=
>&gt; &gt; diff --git a/storageaddsel.C b/storageaddsel.C<br>&gt; &gt; inde=
x 51edc59..cb90aab 100644<br>&gt; &gt; --- a/storageaddsel.C<br>&gt; &gt; +=
++ b/storageaddsel.C<br>&gt; &gt; @@ -193,8 +193,8 @@ int send=5Fesel=5Fto=
=5Fdbus(const char *desc, const <br>&gt; char *sev, const char *details, ui=
<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;finish:<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; &gt; - &nbsp; &nbsp;sd=
=5Fbus=5Fmessage=5Funref(m);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage=
=5Funref(reply);<br>&gt; &gt; + &nbsp; &nbsp;m =3D sd=5Fbus=5Fmessage=5Funr=
ef(m);<br>&gt; &gt; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(rep=
ly);<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return r;<br>&gt; &gt; &nbsp;}<br>&gt=
; &gt; &nbsp;<br>&gt; &gt; diff --git a/transporthandler.C b/transporthandl=
er.C<br>&gt; &gt; index d43f1f9..0fd25f9 100644<br>&gt; &gt; --- a/transpor=
thandler.C<br>&gt; &gt; +++ b/transporthandler.C<br>&gt; &gt; @@ -55,7 +55,=
7 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fnetfn=5Ft <br>&gt; =
netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft =
rc =3D IPMI=5FCC=5FOK;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<=
br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus *bus =3D ipmid=5Fget=5Fsd=5Fbus=
=5Fconnection();<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fbus=5Fmessage *reply =3D =
NULL, *m =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *reply =
=3D NULL;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5F=
BUS=5FERROR=5FNULL;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;int r =3D 0;<br>&gt; &=
gt; &nbsp;<br>&gt; &gt; @@ -84,20 +84,10 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=
=5Fset=5Flan(ipmi=5Fnetfn=5Ft<br>&gt; netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &g=
t; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt=
;data[4],<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;reqptr-&gt;data[5]);<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &n=
bsp; &nbsp; &nbsp;r =3D <br>&gt; sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(b=
us,&amp;m,app,obj,ifc,&quot;SetHwAddress&quot;);<br>&gt; &gt; - &nbsp; &nbs=
p; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;fprintf(stderr, &quot;Failed to add method object: %s\n&quot;,=
 <br>&gt; strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;return -1;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; -=
 &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(m, &quot;s&qu=
ot;, mac);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt=
; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Fai=
led to append message data: %s<br>&gt; \n&quot;, strerror(-r));<br>&gt; &gt=
; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; - &nbs=
p; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=
=5Fbus=5Fcall(bus, m, 0, &amp;error, &amp;reply);<br>&gt; &gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus,app,obj,ifc,&quot;SetHw=
Address&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;error, &am=
p;reply, &quot;s&quot;, mac);<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (r &lt; 0) {<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;fprintf(stderr, &quot;Failed to call method: %s\n&quot;, strerror(-r));=
<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt;=
 &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp; &nbsp; &nbsp;=
}<br>&gt; &gt; &nbsp; &nbsp; &nbsp;else if (reqptr-&gt;parameter =3D=3D LAN=
=5FPARM=5FSUBNET)<br>&gt; &gt; @@ -112,84 +102,72 @@ ipmi=5Fret=5Ft <br>&gt=
; ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<=
br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp; &nbsp; &nbsp;else if=
 (reqptr-&gt;parameter =3D=3D LAN=5FPARM=5FINPROGRESS) // Apply config<br>&=
gt; &gt; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;in=
t rc =3D 0;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage *r=
eq =3D NULL;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage *=
res =3D NULL;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus *bus1 &nbs=
p; &nbsp; &nbsp; &nbsp;=3D NULL;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;=
sd=5Fbus=5Ferror err &nbsp; &nbsp;=3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &gt;=
 - &nbsp; &nbsp; &nbsp; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;if (!strcmp(new=5Fipaddr, &quot;&quot;) || !strcmp (new=5Fnetmask, &quot=
;&quot;) <br>&gt; || !strcmp (new=5Fgateway, &quot;&quot;))<br>&gt; &gt; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;fprintf(stderr,&quot;ERROR: Incomplete LAN Parameters\n=
&quot;);<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;retur=
n -1;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &n=
bsp;rc =3D sd=5Fbus=5Fopen=5Fsystem(&amp;bus1);<br>&gt; &gt; - &nbsp; &nbsp=
; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;{<br=
>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr,&quot;=
ERROR: Getting a SYSTEM bus hook\n&quot;);<br>&gt; &gt; - &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbs=
p;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (=
strcmp(cur=5Fipaddr, &quot;&quot;))<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;{<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=
=5Ferror=5Ffree(&amp;err);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;sd=5Fbus=5Fmessage=5Funref(req);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(res);<br>&gt; &gt; -<br>&g=
t; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=5Fcall=
=5Fmethod(bus1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// On the System B=
us<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;app, &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br>&gt; &gt; -=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj, &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;// Object path <br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;ifc, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/=
/ Interface name<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;&quot;DelAddress4&quot;, &nbsp;// Method to be called<br>&gt; &gt; -=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;err, &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; // object to <br>&gt; return error<br>&gt; &gt; - &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;res, &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; // Response <br>&gt; message on success<br>&gt; &gt; - &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;ssss&quot;, &nbsp; &nbs=
p; &nbsp; &nbsp; // input <br>&gt; message (dev,ip,nm,gw)<br>&gt; &gt; - &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;eth0&quot;,<br>&gt; &=
gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cur=5Fipaddr,<br>&g=
t; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cur=5Fnetmask,<=
br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cur=5Fgate=
way);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbu=
s=5Fcall=5Fmethod(bus, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // On the System =
Bus<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; app, &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj, &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;// Object path<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; ifc, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Interface name<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;DelAddress4=
&quot;, &nbsp;// Method to be called<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &amp;error, &nbsp; &nbsp; &nbsp; &nbsp; //
 object to <br>&gt; return error<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &amp;reply, &nbsp; &nbsp; &nbsp; &nbsp; // Response <br>&g=
t; message on success<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &quot;ssss&quot;, &nbsp; &nbsp; &nbsp; &nbsp; // input <br>&gt; messa=
ge (dev,ip,nm,gw)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &quot;eth0&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; cur=5Fipaddr,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; cur=5Fnetmask,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 cur=5Fgateway);<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &=
gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; =
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(r &lt; 0)<br>&gt; &gt; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;{<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;fprintf(stderr, &quot;Failed to remove existing IP %s: %s<br>&gt; \n&quot=
;, cur=5Fipaddr, err.message);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;return -1;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;fprintf(stderr, &quot;Failed to remove existing IP %s: %s<br>&gt; \n&qu=
ot;, cur=5Fipaddr, error.message);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=
=5Ferror=5Ffree(&amp;err);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fb=
us=5Fmessage=5Funref(req);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fb=
us=5Fmessage=5Funref(res);<br>&gt; &gt; -<br>&gt; &gt; - &nbsp; &nbsp; &nbs=
p; &nbsp;rc =3D sd=5Fbus=5Fcall=5Fmethod(bus1, &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;// On the System Bus<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;app, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Service to conta=
ct<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj, &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;// Object path </tt><br><tt>&gt; &gt; - &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;ifc, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// =
Interface name<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Add=
Address4&quot;, &nbsp;// Method to be called<br>&gt; &gt; - &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;&amp;err, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // object=
 to return error<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;re=
s, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // Response <br>&gt; message on succe=
ss<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;ssss&quot;, &nb=
sp; &nbsp; &nbsp; &nbsp; // input message <br>&gt; (dev,ip,nm,gw)<br>&gt; &=
gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;eth0&quot;,<br>&gt; &gt; - =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;new=5Fipaddr,<br>&gt; &gt; - &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;new=5Fnetmask,<br>&gt; &gt; - &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;new=5Fgateway);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;=
if(rc &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5F=
free(&amp;error);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;reply =3D sd=5F=
bus=5Fmessage=5Funref(reply);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus, &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;// On the System Bus<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; app, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj, &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;// Object path<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i=
fc, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Interface name<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;AddAddress4&quot;, &nbsp;// Method t=
o be called<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;error, &nbsp;=
 &nbsp; &nbsp; &nbsp; // object to return error<br>&gt; &gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &amp;reply, &nbsp; &nbsp; &nbsp; &nbsp; // Response <br>&=
gt; message on success<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;s=
sss&quot;, &nbsp; &nbsp; &nbsp; &nbsp; // input message <br>&gt; (dev,ip,nm=
,gw)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;eth0&quot;,<br>&gt;=
 &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; new=5Fipaddr,<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; new=5Fnetmask,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; new=5Fgateway);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(r &lt; =
0)<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; - &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to set IP %s:=
 %s\n&quot;, <br>&gt; new=5Fipaddr, err.message);<br>&gt; &gt; - &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to set IP %s: %s\n&quot=
;, <br>&gt; new=5Fipaddr, error.message);<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;}<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;else<br>&gt; &gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;strcpy (cur=5Fipaddr, new=5Fipaddr);<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;strcpy (cur=5Fnetmask, new=5Fnetmask);<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;strcpy (cur=5Fgateway, new=5F=
gateway);<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; -<b=
r>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;strcpy (cur=5Fipaddr, new=5Fipaddr=
);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;strcpy (cur=5Fnetmask, new=5Fn=
etmask);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;strcpy (cur=5Fgateway, n=
ew=5Fgateway);<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp; &nbsp=
; &nbsp;else<br>&gt; &gt; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Unsupported parameter 0x%x\n&quot=
;, reqptr-&gt;parameter);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return =
IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;rc =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &gt; &nbsp; &nbsp; &n=
bsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp;return rc;<br>&gt; &g=
t; +finish:<br>&gt; &gt; + &nbsp; &nbsp;// Clenaup the resources allocated =
reply and error<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;er=
ror);<br>&gt; &gt; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(repl=
y);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;return (r &lt; 0) ? -1 : rc;=
<br>&gt; &gt; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;struct get=5Fl=
an=5Ft {<br>&gt; &gt; @@ -206,7 +184,7 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=
=5Fget=5Flan(ipmi=5Fnetfn=5Ft<br>&gt; netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &g=
t; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>&gt; &gt; &=
nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=
=5Fbus *bus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();<br>&gt; &gt; - &nbsp=
; &nbsp;sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;<br>&gt; &gt; + &nb=
sp; &nbsp;sd=5Fbus=5Fmessage *reply =3D NULL;<br>&gt; &gt; &nbsp; &nbsp; &n=
bsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &gt; &nbsp;=
 &nbsp; &nbsp;int r =3D 0;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;const uint8=5Ft=
 current=5Frevision =3D 0x11; // Current rev per IPMI Spec 2.0<br>&gt; &gt;=
 @@ -259,32 +237,27 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Ftransport=5Fget=5Flan=
(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; device &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;eth0&quot;;<br>&gt; &gt; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;uint8=5Ft buf[5]; // Size of expected IPMI respons=
e msg<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;r =3D <=
br>&gt; sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,app,obj,ifc,&qu=
ot;GetAddress4&quot;);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt;=
 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stder=
r, &quot;Failed to add method object: %s\n&quot;, <br>&gt; strerror(-r));<b=
r>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &=
gt; - &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbs=
p;r =3D sd=5Fbus=5Fmessage=5Fappend(m, &quot;s&quot;, device);<br>&gt; &gt;=
 - &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to append message d=
ata: %s<br>&gt; \n&quot;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;=
}<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall(bus, m, 0=
, &amp;error, &amp;reply);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;if (r =
&lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=
=5Fmethod(bus,app,obj,ifc,&quot;GetAddress4&quot;,<br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &amp;error, &amp;reply, &quot;s&quot;, device);<br>&gt=
; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; &gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;fprintf(stderr, &quot;Failed to call method: %s\n&quot;, strerror(-r))=
;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt=
; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D -1;<br>&gt; &gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;rc =
=3D sd=5Fbus=5Fmessage=5Fenter=5Fcontainer (reply, 'a', &quot;(iyyus)&quot;=
);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; &gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fenter=5Fcontainer (rep=
ly, 'a', &quot;(iyyus)&quot;);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;if=
(r &lt; 0)<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed =
to parse response message:<br>&gt; [%s]\n&quot;, strerror(-rc));<br>&gt; &g=
t; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D -1;<br>&gt; &gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=
=5Fmessage=5Fread(reply, &quot;(iyyus)&quot;, &amp;family, <br>&gt; &amp;pr=
efixlen, &amp;scope, &amp;flags, &amp;saddr);<br>&gt; &gt; - &nbsp; &nbsp; =
&nbsp; &nbsp;if (rc &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D=
 sd=5Fbus=5Fmessage=5Fread(reply, &quot;(iyyus)&quot;, &amp;family, <br>&gt=
; &amp;prefixlen, &amp;scope, &amp;flags, &amp;saddr);<br>&gt; &gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fpri=
ntf(stderr, &quot;Failed to receive response: %s\n&quot;, <br>&gt; strerror=
(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D -1;<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;%s:%d:%d:%d:%s\n&quot;, family=3D=3D=
AF=5FINET?&quot;IPv4&quot;:&quot;IPv6&quot;,<br>&gt; prefixlen, scope, flag=
s, saddr);<br>&gt; &gt; @@ -297,7 +270,8 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=
=5Fget=5Flan(ipmi=5Fnetfn=5Ft<br>&gt; netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &g=
t; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (digit =3D=3D NULL)<br>&gt; &gt; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Unexpected IP format: %s&quot;, s=
addr);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=
=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;}<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D 0;<br>&gt;=
 &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while (digit !=3D NULL)<br>&gt; &gt=
; @@ -311,7 +285,7 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fget=5Flan(ipmi=5Fne=
tfn=5Ft<br>&gt; netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;*data=5Flen =3D sizeof(buf);<br>&gt; &gt; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;memcpy(response, &amp;buf, *data=5Flen);<br>&gt; &gt; &nbsp=
;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FOK;<br>&gt; =
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FOK;<br>&gt; &gt; &nbsp=
; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp; &nbsp; &nbsp;else if (reqptr-&gt;param=
eter =3D=3D LAN=5FPARM=5FMAC)<br>&gt; &gt; &nbsp; &nbsp; &nbsp;{<br>&gt; &g=
t; @@ -321,30 +295,26 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Ftransport=5Fget=5Fl=
an(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;uint8=5Ft &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; buf[=
7];<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char *eaddr1 =3D NULL;<b=
r>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;r =3D <br>&gt;=
 sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,app,obj,ifc,&quot;GetH=
wAddress&quot;);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<=
br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &qu=
ot;Failed to add method object: %s\n&quot;, <br>&gt; strerror(-r));<br>&gt;=
 &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; - =
&nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D sd=5Fbus=5Fmessage=5Fappend(m, &quot;s&quot;, device);<br>&gt; &gt; - &=
nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to append message data:=
 %s<br>&gt; \n&quot;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;}<br=
>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall(bus, m, 0, &a=
mp;error, &amp;reply);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt;=
 0) {<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stder=
r, &quot;Failed to call method: %s\n&quot;, strerror(-r));<br>&gt; &gt; - &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus,app,obj,ifc,&quot;GetH=
wAddress&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;error, &a=
mp;reply, &quot;s&quot;, device);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;if (r &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to cal=
l GetHwAddress: %s\n&quot;, <br>&gt; strerror(-r));<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D -1;<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;}<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fmessage=5Fread(reply, &quot;s&quot;, &amp;eaddr1);<br>&gt; &gt; - &nbsp;=
 &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;if (r &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Faile=
d to get a response: %s&quot;, strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FRESPONSE=5F=
ERROR;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto finish;=
<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;if (eaddr1 =3D=3D NULL)<br>&gt; &gt; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;fprintf(stderr, &quot;Failed to get a valid response: %s&quot;,<br>&g=
t; strerror(-r));<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
eturn IPMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;memcpy((void*)&amp;buf[0], &amp;current=5Frevision, 1);<br>&g=
t; &gt; @@ -354,7 +324,8 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fget=5Flan(ipm=
i=5Fnetfn=5Ft<br>&gt; netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;if (digit =3D=3D NULL)<br>&gt; &gt; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;fprintf(stderr, &quot;Unexpected MAC format: %s&quot;, eaddr1);<br>&gt;=
 &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FRESPONS=
E=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D I=
PMI=5FCC=5FRESPONSE=5FERROR;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;goto finish;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>=
&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i=3D0;<br>&=
gt; &gt; @@ -369,14 +340,18 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Ftransport=5Fg=
et=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D sizeof(buf);<br>&gt; &gt; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, &amp;buf, *data=5Flen);<br>&gt; =
&gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FOK=
;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FOK;<br>&gt; =
&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nbsp; &nbsp; &nbsp;else<br>&gt; &g=
t; &nbsp; &nbsp; &nbsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fpr=
intf(stderr, &quot;Unsupported parameter 0x%x\n&quot;, reqptr-&gt;parameter=
);<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FPARM=5FNOT=
=5FSUPPORTED;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5F=
PARM=5FNOT=5FSUPPORTED;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; &nb=
sp;<br>&gt; &gt; +finish:<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffr=
ee(&amp;error);<br>&gt; &gt; + &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5F=
unref(reply);<br>&gt; &gt; +<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return rc;<br=
>&gt; &gt; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; <br></tt><BR>
</body></html>

--0__=EABBF5E2DF8E56DE8f9e8a93df938690918cEABBF5E2DF8E56DE--
