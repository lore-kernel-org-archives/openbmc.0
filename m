Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C38F71A1262
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 17:46:46 +1100 (AEDT)
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 17 Dec 2015 12:16:42 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 17 Dec 2015 12:16:41 +0530
X-IBM-Helo: d28dlp01.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id 364FFE0054
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 12:17:36 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBH6keZj7340540
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 12:16:40 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
 by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBH6keYo004997
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 12:16:40 +0530
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBH6kb7J004889
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 12:16:39 +0530
Message-Id: <201512170646.tBH6kb7J004889@d28av04.in.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 16 Dec 2015 23:46:37 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 16 Dec 2015 23:46:34 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 17 Dec 2015 06:46:33 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 17 Dec 2015 06:46:30 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2015121706462919-59347 ;
 Thu, 17 Dec 2015 06:46:29 +0000 
In-Reply-To: <87wpse5bkf.fsf@birb.au.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v3 1/6] Support host reboot
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Thu, 17 Dec 2015 12:16:27 +0530
References: <1450270225-2497-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450270225-2497-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87wpse5bkf.fsf@birb.au.ibm.com>
X-KeepSent: B5810DBD:29DB0C68-65257F1E:0024F6F7;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 5255
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF58DDFB770678f9e8a93df938690918cEABBF58DDFB77067"
x-cbid: 15121706-0025-0000-0000-000008BB62C7
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.132903; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004672; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000126; SDB=6.00631750; UDB=6.00282922; UTC=2015-12-17
 06:46:32
x-cbparentid: 15121706-9588-0000-0000-0000013FB4F6
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
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
X-List-Received-Date: Thu, 17 Dec 2015 06:46:47 -0000

--0__=EABBF58DDFB770678f9e8a93df938690918cEABBF58DDFB77067
Content-type: multipart/alternative; 
	Boundary="1__=EABBF58DDFB770678f9e8a93df938690918cEABBF58DDFB77067"


--1__=EABBF58DDFB770678f9e8a93df938690918cEABBF58DDFB77067
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


CMD=5FPOWER=5FOFF is for soft-off.

CMD=5FHARD=5FRESET is for hard reset.

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
Date:	17/12/2015 02:57 am
Subject:	Re: [PATCH phosphor-host-ipmid v3 1/6] Support host reboot
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> @@ -89,11 +90,11 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipmi=5Fnetfn=
=5Ft netfn,
ipmi=5Fcmd=5Ft cmd,
>  		 switch(chassis=5Fctrl=5Fcmd)
>  		 {
>  		 		 case CMD=5FPOWER=5FOFF:
> +		 		 		 rc =3D ipmi=5Fchassis=5Fpower=5Fcontrol
("powerOff");
> +		 		 		 break;

Is this a hard power off or a soft one?

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF58DDFB770678f9e8a93df938690918cEABBF58DDFB77067
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>CMD=5FPOWER=5FOFF</tt> is for soft-off.<br><br>CMD=5FHAR=
D=5FRESET is for hard reset.<br><br>Thanks<br><br>-------------------------=
------------------------------------------------------------<br>Thanks and =
Regards,<br>Vishwanath.<br>Advisory Software Engineer,<br>Power Firmware De=
velopment, <br>Systems &amp;Technology Lab,<br>MG2-6F-255 , Manyata Embassy=
 Business Park, <br>Bangalore , KA , 560045<br>Ph: +91-80-46678255<br>E-mai=
l: vishwanath@in.ibm.com<br>-----------------------------------------------=
-----------------------------------<br><br><img width=3D"16" height=3D"16" =
src=3D"cid:1=5F=5F=3DEABBF58DDFB770678f9e8a93df938690918cEAB@" border=3D"0"=
 alt=3D"Inactive hide details for Stewart Smith ---17/12/2015 02:57:53 am--=
-OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; writes: &gt; @@ -8"><fon=
t color=3D"#424282">Stewart Smith ---17/12/2015 02:57:53 am---OpenBMC Patch=
es &lt;openbmc-patches@stwcx.xyz&gt; writes: &gt; @@ -89,11 +90,11 @@ ipmi=
=5Fret=5Ft ipmi=5Fchassis=5Fco</font><br><br><font size=3D"2" color=3D"#5F5=
F5F">From:        </font><font size=3D"2">Stewart Smith &lt;stewart@linux.v=
net.ibm.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </f=
ont><font size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;, ope=
nbmc@lists.ozlabs.org</font><br><font size=3D"2" color=3D"#5F5F5F">Date:   =
     </font><font size=3D"2">17/12/2015 02:57 am</font><br><font size=3D"2"=
 color=3D"#5F5F5F">Subject:        </font><font size=3D"2">Re: [PATCH phosp=
hor-host-ipmid v3 1/6] Support host reboot</font><br><font size=3D"2" color=
=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &l=
t;openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><h=
r width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; =
"><br><br><br><tt>OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; writes:=
<br>&gt; @@ -89,11 +90,11 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipmi=
=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp;                 swit=
ch(chassis=5Fctrl=5Fcmd)<br>&gt; &nbsp;                 {<br>&gt; &nbsp;   =
                               case CMD=5FPOWER=5FOFF:<br>&gt; +           =
                                        rc =3D ipmi=5Fchassis=5Fpower=5Fcon=
trol(&quot;powerOff&quot;);<br>&gt; +                                      =
             break;<br><br>Is this a hard power off or a soft one?<br><br>=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openb=
mc mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://=
lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbm=
c</a></tt><tt><br></tt><br><br><BR>
</body></html>

--1__=EABBF58DDFB770678f9e8a93df938690918cEABBF58DDFB77067--


--0__=EABBF58DDFB770678f9e8a93df938690918cEABBF58DDFB77067
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF58DDFB770678f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF58DDFB770678f9e8a93df938690918cEABBF58DDFB77067--
