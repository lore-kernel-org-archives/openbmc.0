Return-Path: <hramasub@in.ibm.com>
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPRmV73xczDq5v
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 18:57:30 +1100 (AEDT)
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Tue, 15 Mar 2016 13:27:27 +0530
Received: from d28relay03.in.ibm.com (9.184.220.60)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 15 Mar 2016 13:27:25 +0530
X-IBM-Helo: d28relay03.in.ibm.com
X-IBM-MailFrom: hramasub@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2F7vM8M2032000
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 13:27:24 +0530
Message-Id: <201603150757.u2F7vM8M2032000@d28relay03.in.ibm.com>
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Tue, 15 Mar 2016 01:57:22 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 15 Mar 2016 01:57:20 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: hramasub@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Tue, 15 Mar 2016 07:57:19 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 15 Mar 2016 07:57:17 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016031507571704-68614 ;
 Tue, 15 Mar 2016 07:57:17 +0000 
In-Reply-To: <56E77DEB.80604@ozlabs.org>
Subject: Re: [PATCH docs] REST API documentation for OpenBMC user management.
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Tue, 15 Mar 2016 13:27:14 +0530
References: <1457964611-22076-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457964611-22076-2-git-send-email-openbmc-patches@stwcx.xyz>
 <56E77DEB.80604@ozlabs.org>
X-KeepSent: CB225428:81DA8B81-65257F77:002B7D79;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 17063
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF5E4DFB8FBE98f9e8a93df938690918cEABBF5E4DFB8FBE9"
x-cbid: 16031507-0005-0000-0000-00000B190020
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.132901; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005039; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00673580; UDB=6.00308138; UTC=2016-03-15
 07:57:18
x-cbparentid: 16031507-9588-0000-0000-00000270BB3E
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
X-List-Received-Date: Tue, 15 Mar 2016 07:57:31 -0000

--0__=EABBF5E4DFB8FBE98f9e8a93df938690918cEABBF5E4DFB8FBE9
Content-type: multipart/alternative; 
	Boundary="1__=EABBF5E4DFB8FBE98f9e8a93df938690918cEABBF5E4DFB8FBE9"


--1__=EABBF5E4DFB8FBE98f9e8a93df938690918cEABBF5E4DFB8FBE9
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Hi Jeremy,

Thanks for the comments. I agree with all and will soon update the doc to
address the comments.

I don't quite get what I need to be doing for your last comment:
      Also, a signed-off-by line is required, to indicate that you've
agreed
  to the Developers Certificate of Origin.

Thanks,
rhari !

Hariharasubramanian R.
Power Firmware Development
IBM India Systems & Technology Lab, Bangalore, India
Phone:  +91 80 4025 6950



From:	Jeremy Kerr <jk@ozlabs.org>
To:	openbmc@lists.ozlabs.org
Date:	03/15/2016 08:44 AM
Subject:	Re: [PATCH docs] REST API documentation for OpenBMC user
            management.
Sent by:	"openbmc" <openbmc-bounces
            +hramasub=3Din.ibm.com@lists.ozlabs.org>



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


--1__=EABBF5E4DFB8FBE98f9e8a93df938690918cEABBF5E4DFB8FBE9
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Hi Jeremy,<br><br>Thanks for the comments. I agree with all =
and will soon update the doc to address the comments.<br><br>I don't quite =
get what I need to be doing for your last comment:<br>      <tt>Also, a sig=
ned-off-by line is required, to indicate that you've agreed<br> &nbsp;to th=
e Developers Certificate of Origin.</tt><br><br>Thanks,<br>rhari !<br><br>H=
ariharasubramanian R.<br>Power Firmware Development<br>IBM India Systems &a=
mp; Technology Lab, Bangalore, India<br>Phone:  +91 80 4025 6950   <br><br>=
<img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3DEABBF5E4DFB8FBE98f9e8a=
93df938690918cEAB@" border=3D"0" alt=3D"Inactive hide details for Jeremy Ke=
rr ---03/15/2016 08:44:00 AM---Hi Hari, &gt; From: Hariharasubramanian R &l=
t;hramasub@in.ibm.com&gt;"><font color=3D"#424282">Jeremy Kerr ---03/15/201=
6 08:44:00 AM---Hi Hari, &gt; From: Hariharasubramanian R &lt;hramasub@in.i=
bm.com&gt;</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </=
font><font size=3D"2">Jeremy Kerr &lt;jk@ozlabs.org&gt;</font><br><font siz=
e=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">openbmc@lists.=
ozlabs.org</font><br><font size=3D"2" color=3D"#5F5F5F">Date:        </font=
><font size=3D"2">03/15/2016 08:44 AM</font><br><font size=3D"2" color=3D"#=
5F5F5F">Subject:        </font><font size=3D"2">Re: [PATCH docs] REST API d=
ocumentation for OpenBMC user management.</font><br><font size=3D"2" color=
=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &l=
t;openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><hr =
width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; ">=
<br><br><br><tt>Hi Hari,<br><br>&gt; From: Hariharasubramanian R &lt;hramas=
ub@in.ibm.com&gt;<br>&gt; <br>&gt; ---<br>&gt; &nbsp;obmc-userman.md | 82 +=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++<br><br>Thanks for =
this! It's great to have this document. A couple of comments.<br>They're pr=
etty minor though:<br><br>The doc makes reference to the REST API, but is t=
his also applicable to<br>DBUS? If so, we might want to split this up a lit=
tle:<br><br> - formal DBUS specs should do into the dbus-interfaces.md docu=
ment<br><br> - informal usage guides can be a separate document<br><br>It s=
eems that this is more the latter, which is fine. However, you may<br>also =
want to consider adding a spec to the dbus-interfaces doc as an<br>addition=
al change.<br><br>The term 'userman' could be interpreted to mean &quot;Use=
r Manual&quot;, not &quot;User<br>Management&quot;. We don't really need to=
 contract filenames this much,<br>calling it something like user-management=
.md would be fine.<br><br>Could you wrap lines at 80 chars? This makes thin=
gs easier to read in<br>text form. Also, can you also add a reference to th=
is to the main<br>README.md doc?<br><br>Also, a signed-off-by line is requi=
red, to indicate that you've agreed<br>to the Developers Certificate of Ori=
gin.<br><br>Cheers,<br><br><br>Jeremy<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.=
ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc=
">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=EABBF5E4DFB8FBE98f9e8a93df938690918cEABBF5E4DFB8FBE9--


--0__=EABBF5E4DFB8FBE98f9e8a93df938690918cEABBF5E4DFB8FBE9
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF5E4DFB8FBE98f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF5E4DFB8FBE98f9e8a93df938690918cEABBF5E4DFB8FBE9--
