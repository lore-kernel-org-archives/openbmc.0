Return-Path: <mkumatag@in.ibm.com>
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0DFA71A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 04:32:19 +1100 (AEDT)
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Mon, 8 Feb 2016 23:02:16 +0530
Received: from d28relay01.in.ibm.com (9.184.220.58)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 8 Feb 2016 23:02:14 +0530
X-IBM-Helo: d28relay01.in.ibm.com
X-IBM-MailFrom: mkumatag@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u18HWAaE18874790
 for <openbmc@lists.ozlabs.org>; Mon, 8 Feb 2016 23:02:12 +0530
Message-Id: <201602081732.u18HWAaE18874790@d28relay01.in.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Mon, 8 Feb 2016 10:22:00 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 8 Feb 2016 10:21:58 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: mkumatag@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Mon, 8 Feb 2016 17:21:56 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 8 Feb 2016 17:21:49 -0000
Received: from us1a3-mail108.a3.dal06.isc4sb.com ([10.146.45.126])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016020817231011-280308 ;
 Mon, 8 Feb 2016 17:23:10 +0000 
In-Reply-To: <87twljwtjx.fsf@linux.vnet.ibm.com>
Subject: Re: [PATCH rest-dbus] Fix pep8 errors
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Manjunath A Kumatagi" <mkumatag@in.ibm.com>
Date: Mon, 8 Feb 2016 22:23:56 +0530
References: <1454819437-24544-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454819437-24544-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87twljwtjx.fsf@linux.vnet.ibm.com>
X-KeepSent: 5A13859D:614409B3-65257F53:005CC554;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP5 Octobe4, 2013
X-LLNOutbound: False
X-Disclaimed: 33199
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF5C0DFCF43C48f9e8a93df938690918cEABBF5C0DFCF43C4"
x-cbid: 16020817-0005-0000-0000-00000A59E3BF
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.133429; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004894; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000140; SDB=6.00657065; UDB=6.00298117; UTC=2016-02-08
 17:21:51
x-cbparentid: 16020817-4536-0000-0000-0000060CA1BC
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
X-List-Received-Date: Mon, 08 Feb 2016 17:32:20 -0000

--0__=EABBF5C0DFCF43C48f9e8a93df938690918cEABBF5C0DFCF43C4
Content-type: multipart/alternative; 
	Boundary="1__=EABBF5C0DFCF43C48f9e8a93df938690918cEABBF5C0DFCF43C4"


--1__=EABBF5C0DFCF43C48f9e8a93df938690918cEABBF5C0DFCF43C4
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Mentioned comment in the PR.

Thanks,
Manjunath.



From:	Stewart Smith <stewart@linux.vnet.ibm.com>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>,
            openbmc@lists.ozlabs.org
Date:	02/08/2016 12:58 PM
Subject:	Re: [PATCH rest-dbus] Fix pep8 errors
Sent by:	"openbmc" <openbmc-bounces
            +mkumatag=3Din.ibm.com@lists.ozlabs.org>



OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

Looks okay, I think commit message should mention that this is just a
whitespace fix though.

--
Stewart Smith
OPAL Architect, IBM.

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF5C0DFCF43C48f9e8a93df938690918cEABBF5C0DFCF43C4
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Mentioned comment in the PR.<br><br>Thanks,<br>Manjunath.<br=
><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3DEABBF5C0DFCF43C48=
f9e8a93df938690918cEAB@" border=3D"0" alt=3D"Inactive hide details for Stew=
art Smith ---02/08/2016 12:58:10 PM---OpenBMC Patches &lt;openbmc-patches@s=
twcx.xyz&gt; writes: &gt; From:"><font color=3D"#424282">Stewart Smith ---0=
2/08/2016 12:58:10 PM---OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; w=
rites: &gt; From: Manjunath A Kumatagi &lt;mkumatag@in.ibm.co</font><br><br=
><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">St=
ewart Smith &lt;stewart@linux.vnet.ibm.com&gt;</font><br><font size=3D"2" c=
olor=3D"#5F5F5F">To:        </font><font size=3D"2">OpenBMC Patches &lt;ope=
nbmc-patches@stwcx.xyz&gt;, openbmc@lists.ozlabs.org</font><br><font size=
=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">02/08/2016 12=
:58 PM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font>=
<font size=3D"2">Re: [PATCH rest-dbus] Fix pep8 errors</font><br><font size=
=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;open=
bmc&quot; &lt;openbmc-bounces+mkumatag=3Din.ibm.com@lists.ozlabs.org&gt;</f=
ont><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color=
:#8091A5; "><br><br><br><tt>OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&g=
t; writes:<br>&gt; From: Manjunath A Kumatagi &lt;mkumatag@in.ibm.com&gt;<b=
r><br>Looks okay, I think commit message should mention that this is just a=
<br>whitespace fix though.<br><br>-- <br>Stewart Smith<br>OPAL Architect, I=
BM.<br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=
=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/lis=
tinfo/openbmc</a></tt><tt><br></tt><br><br><BR>
</body></html>

--1__=EABBF5C0DFCF43C48f9e8a93df938690918cEABBF5C0DFCF43C4--


--0__=EABBF5C0DFCF43C48f9e8a93df938690918cEABBF5C0DFCF43C4
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF5C0DFCF43C48f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF5C0DFCF43C48f9e8a93df938690918cEABBF5C0DFCF43C4--
