Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp09.in.ibm.com (e28smtp09.in.ibm.com [125.16.236.9])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPRxv6d5MzDq5v
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 19:05:39 +1100 (AEDT)
Received: from localhost
 by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 15 Mar 2016 13:35:37 +0530
Received: from d28relay03.in.ibm.com (9.184.220.60)
 by e28smtp09.in.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 15 Mar 2016 13:35:34 +0530
X-IBM-Helo: d28relay03.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2F85Web9830906
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 13:35:33 +0530
Message-Id: <201603150805.u2F85Web9830906@d28relay03.in.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 15 Mar 2016 04:05:31 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 15 Mar 2016 04:05:29 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 15 Mar 2016 08:05:28 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 15 Mar 2016 08:05:27 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016031508052610-62294 ;
 Tue, 15 Mar 2016 08:05:26 +0000 
In-Reply-To: <201603150757.u2F7vM8M2032000@d28relay03.in.ibm.com>
Subject: Re: [PATCH docs] REST API documentation for OpenBMC user management.
To: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Tue, 15 Mar 2016 13:35:24 +0530
References: <1457964611-22076-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457964611-22076-2-git-send-email-openbmc-patches@stwcx.xyz>
 <56E77DEB.80604@ozlabs.org>
 <201603150757.u2F7vM8M2032000@d28relay03.in.ibm.com>
X-KeepSent: 5AE82DEA:DA6313D3-65257F77:002C664E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 17059
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEABBF5E4DFBFE0DE"
x-cbid: 16031508-0041-0000-0000-000000FA0D67
X-IBM-ISS-SpamDetectors: Score=0.421136; BY=0.132711; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.421136; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005039; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00673583; UDB=6.00308139; UTC=2016-03-15
 08:05:28
x-cbparentid: 16031508-5920-0000-0000-000006A1978E
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
X-List-Received-Date: Tue, 15 Mar 2016 08:05:40 -0000

--0__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEABBF5E4DFBFE0DE
Content-type: multipart/alternative; 
	Boundary="1__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEABBF5E4DFBFE0DE"


--1__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEABBF5E4DFBFE0DE
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


For that question : Refer :

https://github.com/openbmc/docs/blob/master/contributing.md

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



From:	Hariharasubramanian Ramasubramanian/India/IBM@IBMIN
To:	Jeremy Kerr <jk@ozlabs.org>
Cc:	openbmc@lists.ozlabs.org
Date:	15/03/2016 01:27 pm
Subject:	Re: [PATCH docs] REST API documentation for OpenBMC user
            management.
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



Hi Jeremy,

Thanks for the comments. I agree with all and will soon update the doc to
address the comments.

I don't quite get what I need to be doing for your last comment:
Also, a signed-off-by line is required, to indicate that you've agreed
 to the Developers Certificate of Origin.

Thanks,
rhari !

Hariharasubramanian R.
Power Firmware Development
IBM India Systems & Technology Lab, Bangalore, India
Phone: +91 80 4025 6950

Inactive hide details for Jeremy Kerr ---03/15/2016 08:44:00 AM---Hi Hari,
> From: Hariharasubramanian R <hramasub@in.ibm.com>Jeremy Kerr
---03/15/2016 08:44:00 AM---Hi Hari, > From: Hariharasubramanian R
<hramasub@in.ibm.com>

From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Date: 03/15/2016 08:44 AM
Subject: Re: [PATCH docs] REST API documentation for OpenBMC user
management.
Sent by: "openbmc" <openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org>



Hi Hari,

> From: Hariharasubramanian R <hramasub@in.ibm.com>
>
> ---
>  obmc-userman.md | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++
++++++

Thanks for this! It's great to have this document. A couple of comments.
They're pretty minor though:

The doc makes reference to the REST API, but is this also applicable to
DBUS? If so, we might want to split this up a little:

- formal DBUS specs should do into the dbus-interfaces.md document

- informal usage guides can be a separate document

It seems that this is more the latter, which is fine. However, you may
also want to consider adding a spec to the dbus-interfaces doc as an
additional change.

The term 'userman' could be interpreted to mean "User Manual", not "User
Management". We don't really need to contract filenames this much,
calling it something like user-management.md would be fine.

Could you wrap lines at 80 chars? This makes things easier to read in
text form. Also, can you also add a reference to this to the main
README.md doc?

Also, a signed-off-by line is required, to indicate that you've agreed
to the Developers Certificate of Origin.

Cheers,


Jeremy
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEABBF5E4DFBFE0DE
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>For that question : Refer :<br><br><a href=3D"https://github=
.com/openbmc/docs/blob/master/contributing.md">https://github.com/openbmc/d=
ocs/blob/master/contributing.md</a><br><br>Thanks<br><br>------------------=
-------------------------------------------------------------------<br>Than=
ks and Regards,<br>Vishwanath.<br>Advisory Software Engineer,<br>Power Firm=
ware Development, <br>Systems &amp;Technology Lab,<br>MG2-6F-255 , Manyata =
Embassy Business Park, <br>Bangalore , KA , 560045<br>Ph: +91-80-46678255<b=
r>E-mail: vishwanath@in.ibm.com<br>----------------------------------------=
------------------------------------------<br><br><img width=3D"16" height=
=3D"16" src=3D"cid:1=5F=5F=3DEABBF5E4DFBFE0DE8f9e8a93df938690918cEAB@" bord=
er=3D"0" alt=3D"Inactive hide details for Hariharasubramanian Ramasubramani=
an---15/03/2016 01:27:46 pm---Hi Jeremy, Thanks for the comments. I "><font=
 color=3D"#424282">Hariharasubramanian Ramasubramanian---15/03/2016 01:27:4=
6 pm---Hi Jeremy, Thanks for the comments. I agree with all and will soon u=
pdate the doc to</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:    =
    </font><font size=3D"2">Hariharasubramanian Ramasubramanian/India/IBM@I=
BMIN</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><font s=
ize=3D"2">Jeremy Kerr &lt;jk@ozlabs.org&gt;</font><br><font size=3D"2" colo=
r=3D"#5F5F5F">Cc:        </font><font size=3D"2">openbmc@lists.ozlabs.org</=
font><br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=
=3D"2">15/03/2016 01:27 pm</font><br><font size=3D"2" color=3D"#5F5F5F">Sub=
ject:        </font><font size=3D"2">Re: [PATCH docs] REST API documentatio=
n for OpenBMC user management.</font><br><font size=3D"2" color=3D"#5F5F5F"=
>Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bo=
unces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"1=
00%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><b=
r><font size=3D"4">Hi Jeremy,<br><br>Thanks for the comments. I agree with =
all and will soon update the doc to address the comments.<br><br>I don't qu=
ite get what I need to be doing for your last comment:</font><tt><font size=
=3D"4"><br>Also, a signed-off-by line is required, to indicate that you've =
agreed<br> to the Developers Certificate of Origin.</font></tt><font size=
=3D"4"><br><br>Thanks,<br>rhari !<br><br>Hariharasubramanian R.<br>Power Fi=
rmware Development<br>IBM India Systems &amp; Technology Lab, Bangalore, In=
dia<br>Phone: +91 80 4025 6950 <br><br></font><img src=3D"cid:1=5F=5F=3DEAB=
BF5E4DFBFE0DE8f9e8a93df938690918cEAB@" width=3D"16" height=3D"16" alt=3D"In=
active hide details for Jeremy Kerr ---03/15/2016 08:44:00 AM---Hi Hari, &g=
t; From: Hariharasubramanian R &lt;hramasub@in.ibm.com&gt;"><font size=3D"4=
" color=3D"#424282">Jeremy Kerr ---03/15/2016 08:44:00 AM---Hi Hari, &gt; F=
rom: Hariharasubramanian R &lt;hramasub@in.ibm.com&gt;</font><font size=3D"=
4"><br></font><font color=3D"#5F5F5F"><br>From: </font>Jeremy Kerr &lt;jk@o=
zlabs.org&gt;<font color=3D"#5F5F5F"><br>To: </font>openbmc@lists.ozlabs.or=
g<font color=3D"#5F5F5F"><br>Date: </font>03/15/2016 08:44 AM<font color=3D=
"#5F5F5F"><br>Subject: </font>Re: [PATCH docs] REST API documentation for O=
penBMC user management.<font color=3D"#5F5F5F"><br>Sent by: </font>&quot;op=
enbmc&quot; &lt;openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org&gt;<=
font size=3D"4"><br></font><hr width=3D"100%" size=3D"2" align=3D"left" nos=
hade><font size=3D"4"><br><br></font><tt><font size=3D"4"><br>Hi Hari,<br><=
br>&gt; From: Hariharasubramanian R &lt;hramasub@in.ibm.com&gt;<br>&gt; <br=
>&gt; ---<br>&gt; &nbsp;obmc-userman.md | 82 ++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++<br><br>Thanks for this! It's great to have this=
 document. A couple of comments.<br>They're pretty minor though:<br><br>The=
 doc makes reference to the REST API, but is this also applicable to<br>DBU=
S? If so, we might want to split this up a little:<br><br>- formal DBUS spe=
cs should do into the dbus-interfaces.md document<br><br>- informal usage g=
uides can be a separate document<br><br>It seems that this is more the latt=
er, which is fine. However, you may<br>also want to consider adding a spec =
to the dbus-interfaces doc as an<br>additional change.<br><br>The term 'use=
rman' could be interpreted to mean &quot;User Manual&quot;, not &quot;User<=
br>Management&quot;. We don't really need to contract filenames this much,<=
br>calling it something like user-management.md would be fine.<br><br>Could=
 you wrap lines at 80 chars? This makes things easier to read in<br>text fo=
rm. Also, can you also add a reference to this to the main<br>README.md doc=
?<br><br>Also, a signed-off-by line is required, to indicate that you've ag=
reed<br>to the Developers Certificate of Origin.<br><br>Cheers,<br><br><br>=
Jeremy<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org</font></tt><tt><u><=
font size=3D"4" color=3D"#0000FF"><br></font></u></tt><a href=3D"https://li=
sts.ozlabs.org/listinfo/openbmc"><tt><u><font size=3D"4" color=3D"#0000FF">=
https://lists.ozlabs.org/listinfo/openbmc</font></u></tt></a><font size=3D"=
4"><br><br></font><tt>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt=
><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.oz=
labs.org/listinfo/openbmc</a></tt><tt><br></tt><br><br><BR>
</body></html>

--1__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEABBF5E4DFBFE0DE--


--0__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEABBF5E4DFBFE0DE
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF5E4DFBFE0DE8f9e8a93df938690918cEABBF5E4DFBFE0DE--
