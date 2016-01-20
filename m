Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp01.in.ibm.com (e28smtp01.in.ibm.com [125.16.236.1])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8C00E1A1802
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 17:49:59 +1100 (AEDT)
Received: from localhost
 by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 20 Jan 2016 12:19:55 +0530
Received: from d28relay02.in.ibm.com (9.184.220.59)
 by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 20 Jan 2016 12:19:51 +0530
X-IBM-Helo: d28relay02.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d28relay02.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0K6nnSA1573190
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 12:19:50 +0530
Message-Id: <201601200649.u0K6nnSA1573190@d28relay02.in.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 20 Jan 2016 01:48:24 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 20 Jan 2016 01:48:22 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 20 Jan 2016 06:48:21 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 20 Jan 2016 06:48:20 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016012006481995-35131 ;
 Wed, 20 Jan 2016 06:48:19 +0000 
In-Reply-To: <871t9lchae.fsf@linux.vnet.ibm.com>
Subject: Re: [PATCH ipmi-fru-parser v4] Set Fault and Present status while
 handling fru
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Wed, 20 Jan 2016 12:18:14 +0530
References: <1452582011-6265-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452582011-6265-2-git-send-email-openbmc-patches@stwcx.xyz>
 <871t9lchae.fsf@linux.vnet.ibm.com>
X-KeepSent: 9399C2C6:1A6E195E-65257F40:001F952E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 39703
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF5D3DF8C13BE8f9e8a93df938690918cEABBF5D3DF8C13BE"
x-cbid: 16012006-4790-0000-0000-00000CD00E56
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.293971; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004816; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000134; SDB=6.00647849; UDB=6.00292592; UTC=2016-01-20
 06:48:20
x-cbparentid: 16012006-5938-0000-0000-000001B6B0DE
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
X-List-Received-Date: Wed, 20 Jan 2016 06:50:00 -0000

--0__=EABBF5D3DF8C13BE8f9e8a93df938690918cEABBF5D3DF8C13BE
Content-type: multipart/alternative; 
	Boundary="1__=EABBF5D3DF8C13BE8f9e8a93df938690918cEABBF5D3DF8C13BE"


--1__=EABBF5D3DF8C13BE8f9e8a93df938690918cEABBF5D3DF8C13BE
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


hello Stewart,

Thank you for reviewing. Please find my comments.

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



From:	Stewart Smith <stewart@linux.vnet.ibm.com>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>,
            openbmc@lists.ozlabs.org
Date:	14/01/2016 03:06 am
Subject:	Re: [PATCH ipmi-fru-parser v4] Set Fault and Present status
            while handling fru
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> diff --git a/fru-area.H b/fru-area.H
> new file mode 100644
> index 0000000..90dd92b
> --- /dev/null
> +++ b/fru-area.H
> @@ -0,0 +1,153 @@
> +#ifndef =5F=5FIPMI=5FFRU=5FAREA=5FH=5F=5F
> +#define =5F=5FIPMI=5FFRU=5FAREA=5FH=5F=5F
> +
> +#include <stdint.h>
> +#include <stddef.h>
> +#include <systemd/sd-bus.h>
> +#include <string>
> +#include <vector>
> +#include <memory>
> +#include "writefrudata.H"
> +
> +class ipmi=5Ffru;
> +typedef std::vector<std::unique=5Fptr<ipmi=5Ffru>> fru=5Farea=5Fvec=5Ft;
> +
> +class ipmi=5Ffru
> +{
> +    private:
> +        // FRU ID

Comment is not needed, it should be obvious from member name.

> +        uint8=5Ft iv=5Ffruid;

What does iv=5F prefix mean?

iv=5F is widely used C++ notation for class Instance Variable.

> +
> +        // Type of the fru matching offsets in common header
> +        uint8=5Ft iv=5Ftype;

if it's a type of a limited set, should this be an enum?

Sorry, not sure I got this question. Type is actually an enum in frup.h in
ipmi-fru-parser repo.

> +        // If a particular area has been marked valid / invalid
> +        inline bool get=5Fvalid() const
> +        {
> +            return iv=5Fvalid;
> +        }

why not is=5Fvalid() ?

Yeah.. sounds better name.

> --- a/readeeprom.C
> +++ b/readeeprom.C
> @@ -12,7 +12,7 @@ static void exit=5Fwith=5Ferror(const char* err, char**
argv)
>  }
>
>  //----------------------------------------------------------------------=
----

> -// This gets called by udev monitor soon after seeing hog plugs for
EEPROMS.
> +// This gets called by udev monitor soon after seeing hog plugs for
EEPROMS.
>  //----------------------------------------------------------------------=
----


Best to do whitespace fixups in separate patch.

I understand. But do you feel I can go ahead this time and practise this
from next submissions ?. -or- do you see a need to do here ?

>  int main(int argc, char **argv)
>  {
> @@ -21,7 +21,7 @@ int main(int argc, char **argv)
>
>      // Handle to per process system bus
>      sd=5Fbus *bus=5Ftype =3D NULL;
> -
> +

again, whitespace in sep patch

>      // Read the arguments.
>      auto cli=5Foptions =3D std::make=5Funique<ArgumentParser>(argc, argv=
);
>
> @@ -53,7 +53,7 @@ int main(int argc, char **argv)
>
>      // Get a handle to System Bus
>      rc =3D sd=5Fbus=5Fopen=5Fsystem(&bus=5Ftype);
> -    if (rc < 0)
> +    if (rc < 0)

and here

> diff --git a/strgfnhandler.C b/strgfnhandler.C
> index a00688f..eda4290 100644
> --- a/strgfnhandler.C
> +++ b/strgfnhandler.C
> @@ -11,8 +11,8 @@ sd=5Fbus* ipmid=5Fget=5Fsd=5Fbus=5Fconnection(void);
>  ///-------------------------------------------------------
>  // Called by IPMI netfn router for write fru data command
>  //--------------------------------------------------------
> -ipmi=5Fret=5Ft ipmi=5Fstorage=5Fwrite=5Ffru=5Fdata(ipmi=5Fnetfn=5Ft netf=
n, ipmi=5Fcmd=5Ft
cmd,
> -                              ipmi=5Frequest=5Ft request, ipmi=5Frespons=
e=5Ft
response,
> +ipmi=5Fret=5Ft ipmi=5Fstorage=5Fwrite=5Ffru=5Fdata(ipmi=5Fnetfn=5Ft netf=
n, ipmi=5Fcmd=5Ft
cmd,
> +                              ipmi=5Frequest=5Ft request, ipmi=5Frespons=
e=5Ft
response,
>                                ipmi=5Fdata=5Flen=5Ft data=5Flen,
> ipmi=5Fcontext=5Ft context)

and here

>  {
>      FILE *fp =3D NULL;
> @@ -38,7 +38,7 @@ ipmi=5Fret=5Ft ipmi=5Fstorage=5Fwrite=5Ffru=5Fdata(ipmi=
=5Fnetfn=5Ft
netfn, ipmi=5Fcmd=5Ft cmd,
>
>      // On error there is no response data for this command.
>      *data=5Flen =3D 0;
> -
> +

and here

>  #ifdef =5F=5FIPMI=5F=5FDEBUG=5F=5F
>      printf("IPMI WRITE-FRU-DATA for [%s]  Offset =3D [%d] Length =3D
[%d]\n",
>              fru=5Ffile=5Fname, offset, len);
> @@ -59,17 +59,17 @@ ipmi=5Fret=5Ft ipmi=5Fstorage=5Fwrite=5Ffru=5Fdata(ip=
mi=5Fnetfn=5Ft
netfn, ipmi=5Fcmd=5Ft cmd,
>              fclose(fp);
>              return rc;
>          }
> -
> +
>          if(fwrite(&reqptr->data, len, 1, fp) !=3D 1)
>          {
>              perror("Error:");
>              fclose(fp);
>              return rc;
>          }
> -
> +
>          fclose(fp);
> -    }
> -    else
> +    }
> +    else

and here.

>
> +//----------------------------------------------------------------
> +// Constructor
> +//----------------------------------------------------------------
> +ipmi=5Ffru::ipmi=5Ffru(const uint8=5Ft fruid, const uint8=5Ft type,
> +                   sd=5Fbus *bus=5Ftype, bool bmc=5Ffru)

The comment is redundant.

Okay.. It was more of a practise that I have followed to have atleast one
liner on what a particular function is.
Are you seeing it does not make sense ?. I saw couple examples in hostboot
ipmi code with such comments so thought its fine to use.

> +//-----------------------------------------------------
> +// Accepts a pointer to data and sets it in the object.
> +//-----------------------------------------------------
> +void ipmi=5Ffru::set=5Fdata(const uint8=5Ft *data, const size=5Ft len)
> +{
> +    iv=5Flen =3D len;
> +    iv=5Fdata =3D new uint8=5Ft[len];
> +    memcpy(iv=5Fdata, data, len);
> +}

Comment would do better detailing ownership of data rather than simply
explaining what the code obviously does.

Agreed.

> +//-----------------------------------------------------
> +// Sets the dbus parameters
> +//-----------------------------------------------------
> +void ipmi=5Ffru::update=5Fdbus=5Fpaths(const char *bus=5Fname,
> +                      const char *obj=5Fpath, const char *intf=5Fname)
> +{
> +    iv=5Fbus=5Fname =3D bus=5Fname;
> +    iv=5Fobj=5Fpath =3D obj=5Fpath;
> +    iv=5Fintf=5Fname =3D intf=5Fname;
> +}

why are we passing in C strings when everything else is std::string?
It's just as easy to create std::string on the way in as it is to do so
here, and if the caller is dealing with std::string, then we have more
hoops

Norm's skeleton code which I am calling to get those parameters are
returning them as char *s

> +
> +//-------------------
> +// Destructor
> +//-------------------
> +ipmi=5Ffru::~ipmi=5Ffru()

redundant comment.

>  //------------------------------------------------
>  // Takes the pointer to stream of bytes and length
>  // returns the 8 bit checksum per IPMI spec.
>  //-------------------------------------------------
> -unsigned char calculate=5Fcrc(unsigned char *data, int len)
> +unsigned char calculate=5Fcrc(const unsigned char *data, size=5Ft len)
>  {
>      char crc =3D 0;
> -    int byte =3D 0;
> +    size=5Ft byte =3D 0;
>
>      for(byte =3D 0; byte < len; byte++)
>      {

This should likely be a separate patch, this change seems unrelated to
the other changes.

You mean, submit a patch for changing the name ?

What is the checksum anyway? Is it CRC32? A byte at a time loop is
unlikely to be the most optimal way of doing things.

Its a standard IPMI V2.0 checksum algo.

http://www.intel.in/content/dam/www/public/us/en/documents/product-briefs/i=
pmi-second-gen-interface-spec-v2-rev1-1.pdf


Page #: 163 / 208

--
Stewart Smith
OPAL Architect, IBM.

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF5D3DF8C13BE8f9e8a93df938690918cEABBF5D3DF8C13BE
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>hello Stewart,<br><br>Thank you for reviewing. Please find m=
y <font color=3D"#0000FF">comments</font>.<br><br>Thanks<br><br>-----------=
--------------------------------------------------------------------------<=
br>Thanks and Regards,<br>Vishwanath.<br>Advisory Software Engineer,<br>Pow=
er Firmware Development, <br>Systems &amp;Technology Lab,<br>MG2-6F-255 , M=
anyata Embassy Business Park, <br>Bangalore , KA , 560045<br>Ph: +91-80-466=
78255<br>E-mail: vishwanath@in.ibm.com<br>---------------------------------=
-------------------------------------------------<br><br><img width=3D"16" =
height=3D"16" src=3D"cid:1=5F=5F=3DEABBF5D3DF8C13BE8f9e8a93df938690918cEAB@=
" border=3D"0" alt=3D"Inactive hide details for Stewart Smith ---14/01/2016=
 03:06:05 am---OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; writes: &g=
t; diff "><font color=3D"#424282">Stewart Smith ---14/01/2016 03:06:05 am--=
-OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; writes: &gt; diff --git =
a/fru-area.H b/fru-area.H</font><br><br><font size=3D"2" color=3D"#5F5F5F">=
From:        </font><font size=3D"2">Stewart Smith &lt;stewart@linux.vnet.i=
bm.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><=
font size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;, openbmc@=
lists.ozlabs.org</font><br><font size=3D"2" color=3D"#5F5F5F">Date:        =
</font><font size=3D"2">14/01/2016 03:06 am</font><br><font size=3D"2" colo=
r=3D"#5F5F5F">Subject:        </font><font size=3D"2">Re: [PATCH ipmi-fru-p=
arser v4] Set Fault and Present status while handling fru</font><br><font s=
ize=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;o=
penbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org&g=
t;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"=
color:#8091A5; "><br><br><br><tt>OpenBMC Patches &lt;openbmc-patches@stwcx.=
xyz&gt; writes:<br>&gt; diff --git a/fru-area.H b/fru-area.H<br>&gt; new fi=
le mode 100644<br>&gt; index 0000000..90dd92b<br>&gt; --- /dev/null<br>&gt;=
 +++ b/fru-area.H<br>&gt; @@ -0,0 +1,153 @@<br>&gt; +#ifndef =5F=5FIPMI=5FF=
RU=5FAREA=5FH=5F=5F<br>&gt; +#define =5F=5FIPMI=5FFRU=5FAREA=5FH=5F=5F<br>&=
gt; +<br>&gt; +#include &lt;stdint.h&gt;<br>&gt; +#include &lt;stddef.h&gt;=
<br>&gt; +#include &lt;systemd/sd-bus.h&gt;<br>&gt; +#include &lt;string&gt=
;<br>&gt; +#include &lt;vector&gt;<br>&gt; +#include &lt;memory&gt;<br>&gt;=
 +#include &quot;writefrudata.H&quot;<br>&gt; +<br>&gt; +class ipmi=5Ffru;<=
br>&gt; +typedef std::vector&lt;std::unique=5Fptr&lt;ipmi=5Ffru&gt;&gt; fru=
=5Farea=5Fvec=5Ft;<br>&gt; +<br>&gt; +class ipmi=5Ffru<br>&gt; +{<br>&gt; +=
 &nbsp; &nbsp;private:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// FRU ID<br><b=
r>Comment is not needed, it should be obvious from member name.<br><br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft iv=5Ffruid;<br><br>What does iv=5F =
prefix mean?</tt><br><br><tt><font color=3D"#0000FF">iv=5F is widely used C=
++ notation for class Instance Variable.<br></font></tt><tt><br>&gt; +<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Type of the fru matching offsets in com=
mon header<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft iv=5Ftype;<br><br=
>if it's a type of a limited set, should this be an enum?<br></tt><br><tt><=
font color=3D"#0000FF">Sorry, not sure I got this question. Type is actuall=
y an enum in frup.h in ipmi-fru-parser repo. </font></tt><br><tt><br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;// If a particular area has been marked valid /=
 invalid<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;inline bool get=5Fvalid() con=
st<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;return iv=5Fvalid;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}=
<br><br>why not is=5Fvalid() ?</tt><br><br><tt><font color=3D"#0000FF">Yeah=
.. sounds better name.<br></font></tt><tt><br>&gt; --- a/readeeprom.C<br>&g=
t; +++ b/readeeprom.C<br>&gt; @@ -12,7 +12,7 @@ static void exit=5Fwith=5Fe=
rror(const char* err, char** argv)<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; &=
nbsp;//--------------------------------------------------------------------=
------<br>&gt; -// This gets called by udev monitor soon after seeing hog p=
lugs for EEPROMS. <br>&gt; +// This gets called by udev monitor soon after =
seeing hog plugs for EEPROMS.<br>&gt; &nbsp;//-----------------------------=
---------------------------------------------<br><br>Best to do whitespace =
fixups in separate patch.</tt><br><br><tt><font color=3D"#0000FF">I underst=
and. But do you feel I can go ahead this time and practise this from next s=
ubmissions ?. -or- do you see a need to do here ?</font></tt><tt><br><br>&g=
t; &nbsp;int main(int argc, char **argv)<br>&gt; &nbsp;{<br>&gt; @@ -21,7 +=
21,7 @@ int main(int argc, char **argv)<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp=
; &nbsp;// Handle to per process system bus<br>&gt; &nbsp; &nbsp; &nbsp;sd=
=5Fbus *bus=5Ftype =3D NULL;<br>&gt; - &nbsp; &nbsp;<br>&gt; +<br><br>again=
, whitespace in sep patch<br><br>&gt; &nbsp; &nbsp; &nbsp;// Read the argum=
ents.<br>&gt; &nbsp; &nbsp; &nbsp;auto cli=5Foptions =3D std::make=5Funique=
&lt;ArgumentParser&gt;(argc, argv);<br>&gt; &nbsp;<br>&gt; @@ -53,7 +53,7 @=
@ int main(int argc, char **argv)<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbs=
p;// Get a handle to System Bus<br>&gt; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=
=5Fopen=5Fsystem(&amp;bus=5Ftype);<br>&gt; - &nbsp; &nbsp;if (rc &lt; 0) <b=
r>&gt; + &nbsp; &nbsp;if (rc &lt; 0)<br><br>and here<br><br>&gt; diff --git=
 a/strgfnhandler.C b/strgfnhandler.C<br>&gt; index a00688f..eda4290 100644<=
br>&gt; --- a/strgfnhandler.C<br>&gt; +++ b/strgfnhandler.C<br>&gt; @@ -11,=
8 +11,8 @@ sd=5Fbus* ipmid=5Fget=5Fsd=5Fbus=5Fconnection(void);<br>&gt; &nb=
sp;///-------------------------------------------------------<br>&gt; &nbsp=
;// Called by IPMI netfn router for write fru data command<br>&gt; &nbsp;//=
--------------------------------------------------------<br>&gt; -ipmi=5Fre=
t=5Ft ipmi=5Fstorage=5Fwrite=5Ffru=5Fdata(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcm=
d=5Ft cmd, <br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft reque=
st, ipmi=5Fresponse=5Ft response, <br>&gt; +ipmi=5Fret=5Ft ipmi=5Fstorage=
=5Fwrite=5Ffru=5Fdata(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Fle=
n=5Ft data=5Flen,<br>&gt; ipmi=5Fcontext=5Ft context)<br><br>and here<br><b=
r>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;FILE *fp =3D NULL;<br>&gt; @@ -3=
8,7 +38,7 @@ ipmi=5Fret=5Ft ipmi=5Fstorage=5Fwrite=5Ffru=5Fdata(ipmi=5Fnetf=
n=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp=
;// On error there is no response data for this command.<br>&gt; &nbsp; &nb=
sp; &nbsp;*data=5Flen =3D 0;<br>&gt; - &nbsp; &nbsp;<br>&gt; +<br><br>and h=
ere<br><br>&gt; &nbsp;#ifdef =5F=5FIPMI=5F=5FDEBUG=5F=5F<br>&gt; &nbsp; &nb=
sp; &nbsp;printf(&quot;IPMI WRITE-FRU-DATA for [%s] &nbsp;Offset =3D [%d] L=
ength =3D [%d]\n&quot;,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;fru=5Ffile=5Fname, offset, len);<br>&gt; @@ -59,17 +59,17 @@ ipmi=5Fre=
t=5Ft ipmi=5Fstorage=5Fwrite=5Ffru=5Fdata(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcm=
d=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fclose(f=
p);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return rc;<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; - &nbsp; &nbsp;<br>&gt; +<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if(fwrite(&amp;reqptr-&gt;data, le=
n, 1, fp) !=3D 1)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;perror(&quot;Error:&quot;);<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fclose(fp);<br>&gt; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;}<br>&gt; - &nbsp; &nbsp;<br>&gt; +<br>&gt; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;fclose(fp);<br>&gt; - &nbsp; &nbsp;} <br>&gt; - &=
nbsp; &nbsp;else <br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;else<br><=
br>and here.<br><br>&gt; &nbsp;<br>&gt; +//--------------------------------=
--------------------------------<br>&gt; +// Constructor<br>&gt; +//-------=
---------------------------------------------------------<br>&gt; +ipmi=5Ff=
ru::ipmi=5Ffru(const uint8=5Ft fruid, const uint8=5Ft type,<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sd=5Fbus *bus=5Ft=
ype, bool bmc=5Ffru)<br><br>The comment is redundant.<br></tt><br><tt><font=
 color=3D"#0000FF">Okay.. It was more of a practise that I have followed to=
 have atleast one liner on what a particular function is.</font></tt><br><t=
t><font color=3D"#0000FF">Are you seeing it does not make sense ?. I saw co=
uple examples in hostboot ipmi code with such comments so thought its fine =
to use.</font></tt><br><tt><br>&gt; +//------------------------------------=
-----------------<br>&gt; +// Accepts a pointer to data and sets it in the =
object.<br>&gt; +//-----------------------------------------------------<br=
>&gt; +void ipmi=5Ffru::set=5Fdata(const uint8=5Ft *data, const size=5Ft le=
n)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;iv=5Flen =3D len;<br>&gt; + &nbsp; &nb=
sp;iv=5Fdata =3D new uint8=5Ft[len];<br>&gt; + &nbsp; &nbsp;memcpy(iv=5Fdat=
a, data, len);<br>&gt; +}<br><br>Comment would do better detailing ownershi=
p of data rather than simply<br>explaining what the code obviously does.</t=
t><br><br><tt><font color=3D"#0000FF">Agreed</font></tt><tt>.<br><br>&gt; +=
//-----------------------------------------------------<br>&gt; +// Sets th=
e dbus parameters<br>&gt; +//----------------------------------------------=
-------<br>&gt; +void ipmi=5Ffru::update=5Fdbus=5Fpaths(const char *bus=5Fn=
ame,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;const char *obj=5Fpath, const char *intf=5Fname)<br>&gt; +{=
<br>&gt; + &nbsp; &nbsp;iv=5Fbus=5Fname =3D bus=5Fname;<br>&gt; + &nbsp; &n=
bsp;iv=5Fobj=5Fpath =3D obj=5Fpath;<br>&gt; + &nbsp; &nbsp;iv=5Fintf=5Fname=
 =3D intf=5Fname;<br>&gt; +}<br><br>why are we passing in C strings when ev=
erything else is std::string?<br>It's just as easy to create std::string on=
 the way in as it is to do so<br>here, and if the caller is dealing with st=
d::string, then we have more hoops<br></tt><br><tt><font color=3D"#0000FF">=
Norm's skeleton code which I am calling to get those parameters are returni=
ng them as char *s</font></tt><br><tt><br>&gt; +<br>&gt; +//---------------=
----<br>&gt; +// Destructor<br>&gt; +//-------------------<br>&gt; +ipmi=5F=
fru::~ipmi=5Ffru()<br><br>redundant comment.<br><br>&gt; &nbsp;//----------=
--------------------------------------<br>&gt; &nbsp;// Takes the pointer t=
o stream of bytes and length<br>&gt; &nbsp;// returns the 8 bit checksum pe=
r IPMI spec.<br>&gt; &nbsp;//----------------------------------------------=
---<br>&gt; -unsigned char calculate=5Fcrc(unsigned char *data, int len)<br=
>&gt; +unsigned char calculate=5Fcrc(const unsigned char *data, size=5Ft le=
n)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;char crc =3D 0;<br>&gt; - &n=
bsp; &nbsp;int byte =3D 0;<br>&gt; + &nbsp; &nbsp;size=5Ft byte =3D 0;<br>&=
gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;for(byte =3D 0; byte &lt; len; byte+=
+)<br>&gt; &nbsp; &nbsp; &nbsp;{<br><br>This should likely be a separate pa=
tch, this change seems unrelated to<br>the other changes.<br></tt><br><tt><=
font color=3D"#0000FF">You mean, submit a patch for changing the name ?</fo=
nt></tt><br><tt><br>What is the checksum anyway? Is it CRC32? A byte at a t=
ime loop is<br>unlikely to be the most optimal way of doing things.<br></tt=
><br><tt><font color=3D"#0000FF">Its a standard IPMI V2.0 checksum algo.</f=
ont></tt><br><br><a href=3D"http://www.intel.in/content/dam/www/public/us/e=
n/documents/product-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf"><t=
t>http://www.intel.in/content/dam/www/public/us/en/documents/product-briefs=
/ipmi-second-gen-interface-spec-v2-rev1-1.pdf</tt></a><tt><br></tt><br><tt>=
<font color=3D"#0000FF">Page #: 163 / 208</font></tt><tt><br><br>-- <br>Ste=
wart Smith<br>OPAL Architect, IBM.<br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.=
ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc=
">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><br><B=
R>
</body></html>

--1__=EABBF5D3DF8C13BE8f9e8a93df938690918cEABBF5D3DF8C13BE--


--0__=EABBF5D3DF8C13BE8f9e8a93df938690918cEABBF5D3DF8C13BE
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF5D3DF8C13BE8f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF5D3DF8C13BE8f9e8a93df938690918cEABBF5D3DF8C13BE--
