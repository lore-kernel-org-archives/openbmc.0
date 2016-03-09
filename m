Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A0F181A010D
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 16:54:43 +1100 (AEDT)
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 9 Mar 2016 11:24:40 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 9 Mar 2016 11:24:37 +0530
X-IBM-Helo: d28relay05.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u295sMrT21365036
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:24:24 +0530
Message-Id: <201603090554.u295sMrT21365036@d28relay05.in.ibm.com>
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 8 Mar 2016 22:54:35 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 8 Mar 2016 22:54:33 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 9 Mar 2016 05:54:32 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 9 Mar 2016 05:54:31 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016030905543171-34931 ;
 Wed, 9 Mar 2016 05:54:31 +0000 
In-Reply-To: <87io0w9q9h.fsf@linux.vnet.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2] DCMI GET_POWER_LEVEL bad return
 code
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org,
 Norman James <nkskjames@gmail.com>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Wed, 9 Mar 2016 11:24:31 +0530
References: <1457453438-9977-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457453438-9977-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87io0w9q9h.fsf@linux.vnet.ibm.com>
X-KeepSent: 84E297C1:E038A937-65257F71:00205D6D;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 25479
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEABBF5E2DFB3DBFD"
x-cbid: 16030905-0025-0000-0000-00000A6756EC
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.132496; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005014; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00670704; UDB=6.00306437; UTC=2016-03-09
 05:54:32
x-cbparentid: 16030905-4778-0000-0000-000002583DBC
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
X-List-Received-Date: Wed, 09 Mar 2016 05:54:44 -0000

--0__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEABBF5E2DFB3DBFD
Content-type: multipart/alternative; 
	Boundary="1__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEABBF5E2DFB3DBFD"


--1__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEABBF5E2DFB3DBFD
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Shouldn't the value of rc be something that is an ipmi=5Fret=5Ft ?

Yes : It needs to be even though CC=5FOK and 0 are same.

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
Cc:	Norman James <nkskjames@gmail.com>
Date:	09/03/2016 10:56 am
Subject:	Re: [PATCH phosphor-host-ipmid v2] DCMI GET=5FPOWER=5FLEVEL bad
            return code
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Norman James <njames@us.ibm.com>
>
> This function uses static data and should always
> return a good return code.  This was causing OCC
> not to start.
>
> Signed-off-by: Norman James <nkskjames@gmail.com>
> ---
>  dcmihandler.C | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/dcmihandler.C b/dcmihandler.C
> index fafebdc..5e7d879 100644
> --- a/dcmihandler.C
> +++ b/dcmihandler.C
> @@ -11,7 +11,7 @@ ipmi=5Fret=5Ft ipmi=5Fdcmi=5Fget=5Fpower=5Flimit(ipmi=
=5Fnetfn=5Ft
netfn, ipmi=5Fcmd=5Ft cmd,
>                                ipmi=5Frequest=5Ft request, ipmi=5Frespons=
e=5Ft
response,
>                                ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fc=
ontext=5Ft
context)
>  {
> -    ipmi=5Fret=5Ft rc =3D IPMI=5FDCMI=5FCC=5FNO=5FACTIVE=5FPOWER=5FLIMIT;
> +    ipmi=5Fret=5Ft rc =3D 0;
>
>      // dcmi-v1-5-rev-spec.pdf 6.6.2.

Shouldn't the value of rc be something that is an ipmi=5Fret=5Ft ?

>      // This is good enough for OpenBMC support for OpenPOWER based
systems
> @@ -37,4 +37,3 @@ void register=5Fnetfn=5Fdcmi=5Ffunctions()
>      ipmi=5Fregister=5Fcallback(NETFUN=5FGRPEXT, IPMI=5FCMD=5FDCMI=5FGET=
=5FPOWER, NULL,
ipmi=5Fdcmi=5Fget=5Fpower=5Flimit);
>      return;
>  }
> -// 956379
> \ No newline at end of file

Above hunk is irrelevant.

--
Stewart Smith
OPAL Architect, IBM.

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEABBF5E2DFB3DBFD
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Shouldn't the value of rc be something that is an ipmi=
=5Fret=5Ft ?</tt><br><br>Yes : It needs to be even though CC=5FOK and 0 are=
 same.<br><br>Thanks<br><br>-----------------------------------------------=
--------------------------------------<br>Thanks and Regards,<br>Vishwanath=
.<br>Advisory Software Engineer,<br>Power Firmware Development, <br>Systems=
 &amp;Technology Lab,<br>MG2-6F-255 , Manyata Embassy Business Park, <br>Ba=
ngalore , KA , 560045<br>Ph: +91-80-46678255<br>E-mail: vishwanath@in.ibm.c=
om<br>---------------------------------------------------------------------=
-------------<br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3DE=
ABBF5E2DFB3DBFD8f9e8a93df938690918cEAB@" border=3D"0" alt=3D"Inactive hide =
details for Stewart Smith ---09/03/2016 10:56:02 am---OpenBMC Patches &lt;o=
penbmc-patches@stwcx.xyz&gt; writes: &gt; From:"><font color=3D"#424282">St=
ewart Smith ---09/03/2016 10:56:02 am---OpenBMC Patches &lt;openbmc-patches=
@stwcx.xyz&gt; writes: &gt; From: Norman James &lt;njames@us.ibm.com&gt;</f=
ont><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font si=
ze=3D"2">Stewart Smith &lt;stewart@linux.vnet.ibm.com&gt;</font><br><font s=
ize=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">OpenBMC Patc=
hes &lt;openbmc-patches@stwcx.xyz&gt;, openbmc@lists.ozlabs.org</font><br><=
font size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=3D"2">Norman=
 James &lt;nkskjames@gmail.com&gt;</font><br><font size=3D"2" color=3D"#5F5=
F5F">Date:        </font><font size=3D"2">09/03/2016 10:56 am</font><br><fo=
nt size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=3D"2">Re:=
 [PATCH phosphor-host-ipmid v2] DCMI GET=5FPOWER=5FLEVEL bad return code</f=
ont><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font siz=
e=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com@lis=
ts.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" no=
shade style=3D"color:#8091A5; "><br><br><br><tt>OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt; writes:<br><br>&gt; From: Norman James &lt;njames@us=
.ibm.com&gt;<br>&gt;<br>&gt; This function uses static data and should alwa=
ys<br>&gt; return a good return code. &nbsp;This was causing OCC<br>&gt; no=
t to start.<br>&gt;<br>&gt; Signed-off-by: Norman James &lt;nkskjames@gmail=
.com&gt;<br>&gt; ---<br>&gt; &nbsp;dcmihandler.C | 3 +--<br>&gt; &nbsp;1 fi=
le changed, 1 insertion(+), 2 deletions(-)<br>&gt;<br>&gt; diff --git a/dcm=
ihandler.C b/dcmihandler.C<br>&gt; index fafebdc..5e7d879 100644<br>&gt; --=
- a/dcmihandler.C<br>&gt; +++ b/dcmihandler.C<br>&gt; @@ -11,7 +11,7 @@ ipm=
i=5Fret=5Ft ipmi=5Fdcmi=5Fget=5Fpower=5Flimit(ipmi=5Fnetfn=5Ft netfn, ipmi=
=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=
=5Ft request, ipmi=5Fresponse=5Ft response, <br>&gt; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)=
<br>&gt; &nbsp;{<br>&gt; - &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FDCMI=
=5FCC=5FNO=5FACTIVE=5FPOWER=5FLIMIT;<br>&gt; + &nbsp; &nbsp;ipmi=5Fret=5Ft =
rc =3D 0;<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;// dcmi-v1-5-rev-spec.=
pdf 6.6.2.<br><br>Shouldn't the value of rc be something that is an ipmi=5F=
ret=5Ft ?<br><br>&gt; &nbsp; &nbsp; &nbsp;// This is good enough for OpenBM=
C support for OpenPOWER based systems<br>&gt; @@ -37,4 +37,3 @@ void regist=
er=5Fnetfn=5Fdcmi=5Ffunctions()<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fregister=
=5Fcallback(NETFUN=5FGRPEXT, IPMI=5FCMD=5FDCMI=5FGET=5FPOWER, NULL, ipmi=5F=
dcmi=5Fget=5Fpower=5Flimit);<br>&gt; &nbsp; &nbsp; &nbsp;return;<br>&gt; &n=
bsp;}<br>&gt; -// 956379<br>&gt; \ No newline at end of file<br><br>Above h=
unk is irrelevant.<br><br>-- <br>Stewart Smith<br>OPAL Architect, IBM.<br><=
br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>op=
enbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https=
://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/ope=
nbmc</a></tt><tt><br></tt><br><br><BR>
</body></html>

--1__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEABBF5E2DFB3DBFD--


--0__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEABBF5E2DFB3DBFD
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF5E2DFB3DBFD8f9e8a93df938690918cEABBF5E2DFB3DBFD--
