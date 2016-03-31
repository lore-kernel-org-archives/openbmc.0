Return-Path: <njames@us.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qbffP1slrzDq5y
 for <openbmc@lists.ozlabs.org>; Fri,  1 Apr 2016 09:42:36 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 31 Mar 2016 18:42:34 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 31 Mar 2016 18:42:32 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id D6F416E803C
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 18:29:21 -0400 (EDT)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2VMgWBZ34865280
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 22:42:32 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2VMgWkL014387
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 18:42:32 -0400
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2VMgVSM014351
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 18:42:31 -0400
Message-Id: <201603312242.u2VMgVSM014351@d01av03.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 31 Mar 2016 16:42:31 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 31 Mar 2016 16:42:28 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 31 Mar 2016 22:42:27 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 31 Mar 2016 22:42:26 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016033122422577-490467 ;
 Thu, 31 Mar 2016 22:42:25 +0000 
MIME-Version: 1.0
In-Reply-To: <1459433964519.44939@RACKSPACE.COM>
Subject: Re: obmcutil is slow, nonsensical output
To: Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>
From: "Norman James" <njames@us.ibm.com>
Date: Fri, 1 Apr 2016 06:38:59 +0800
References: <87wpojtcb4.fsf@birb.au.ibm.com>
 <1459433964519.44939@RACKSPACE.COM>
X-KeepSent: 2F1BE4FF:5CF8A60A-48257F87:007C0B54;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP5 SHF106 December 12, 2015
X-LLNOutbound: False
X-Disclaimed: 5547
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=C7BBF514DFEF8DC48f9e8a93df938690918cC7BBF514DFEF8DC4"
x-cbid: 16033122-0057-0000-0000-000003EB5CD8
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.133635; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005102; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000156; SDB=6.00681477; UDB=6.00312819; UTC=2016-03-31
 22:42:26
x-cbparentid: 16033122-4536-0000-0000-000006F14979
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
X-List-Received-Date: Thu, 31 Mar 2016 22:42:38 -0000

--0__=C7BBF514DFEF8DC48f9e8a93df938690918cC7BBF514DFEF8DC4
Content-type: multipart/alternative; 
	Boundary="1__=C7BBF514DFEF8DC48f9e8a93df938690918cC7BBF514DFEF8DC4"


--1__=C7BBF514DFEF8DC48f9e8a93df938690918cC7BBF514DFEF8DC4
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


obmcutil was intended as a lab debug tool only.  It is simply a lookup of
shortcuts to the dbus calls.  It prints out whatever the dbus call returns.
All of the slowness is due to python importing several libraries which is
slow because the CPU is already highly utilized.   Brad looked into this at
one point and collected some data.

Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
To:	Stewart Smith <stewart@linux.vnet.ibm.com>, openbmc
            <openbmc@lists.ozlabs.org>
Date:	03/31/2016 10:35 PM
Subject:	Re: obmcutil is slow, nonsensical output
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



We see the same behavior on the Barreleye servers, the obmcutil is quite
slow but we've gotten used to it. The poweron and poweroff commands usually
return either this message or a python backtrace if the backend dbus
services are still warming up.
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
From: openbmc <openbmc-bounces
+kenneth.wilke=3Drackspace.com@lists.ozlabs.org> on behalf of Stewart Smith
<stewart@linux.vnet.ibm.com>
Sent: Thursday, March 31, 2016 1:02 AM
To: openbmc
Subject: obmcutil is slow, nonsensical output

root@palmetto:~# time obmcutil 2>&1 > /dev/null

real    0m3.301s
user    0m3.030s
sys     0m0.230s

root@palmetto:~# obmcutil poweron
 =3D None

The above is really confusing as to what is actually going on... does
that mean success? Does that mean there's no power? Does that mean no
action was taken?


--
Stewart Smith
OPAL Architect, IBM.

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



--1__=C7BBF514DFEF8DC48f9e8a93df938690918cC7BBF514DFEF8DC4
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>obmcutil was intended as a lab debug tool only.  It is simpl=
y a lookup of shortcuts to the dbus calls.  It prints out whatever the dbus=
 call returns.    All of the slowness is due to python importing several li=
braries which is slow because the CPU is already highly utilized.   Brad lo=
oked into this at one point and collected some data.  <br><br>Regards,<br>N=
orman James<br>IBM - POWER Systems Architect<br>Phone: 1-512-286-6807 (T/L:=
 363-6807)<br>Internet: njames@us.ibm.com<br><br><br><img width=3D"16" heig=
ht=3D"16" src=3D"cid:1=5F=5F=3DC7BBF514DFEF8DC48f9e8a93df938690918cC7B@" bo=
rder=3D"0" alt=3D"Inactive hide details for Kenneth Wilke ---03/31/2016 10:=
35:48 PM---We see the same behavior on the Barreleye servers, the obmc"><fo=
nt color=3D"#424282">Kenneth Wilke ---03/31/2016 10:35:48 PM---We see the s=
ame behavior on the Barreleye servers, the obmcutil is quite slow but we've=
 gotten used</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        =
</font><font size=3D"2">Kenneth Wilke &lt;kenneth.wilke@RACKSPACE.COM&gt;</=
font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D=
"2">Stewart Smith &lt;stewart@linux.vnet.ibm.com&gt;, openbmc &lt;openbmc@l=
ists.ozlabs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Date:     =
   </font><font size=3D"2">03/31/2016 10:35 PM</font><br><font size=3D"2" c=
olor=3D"#5F5F5F">Subject:        </font><font size=3D"2">Re: obmcutil is sl=
ow, nonsensical output</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by=
:        </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+nj=
ames=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D=
"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>We see=
 the same behavior on the Barreleye servers, the obmcutil is quite slow but=
 we've gotten used to it. The poweron and poweroff commands usually return =
either this message or a python backtrace if the backend dbus services are =
still warming up.<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>From:=
 openbmc &lt;openbmc-bounces+kenneth.wilke=3Drackspace.com@lists.ozlabs.org=
&gt; on behalf of Stewart Smith &lt;stewart@linux.vnet.ibm.com&gt;<br>Sent:=
 Thursday, March 31, 2016 1:02 AM<br>To: openbmc<br>Subject: obmcutil is sl=
ow, nonsensical output<br><br>root@palmetto:~# time obmcutil 2&gt;&amp;1 &g=
t; /dev/null<br><br>real &nbsp; &nbsp;0m3.301s<br>user &nbsp; &nbsp;0m3.030=
s<br>sys &nbsp; &nbsp; 0m0.230s<br><br>root@palmetto:~# obmcutil poweron<br=
> =3D None<br><br>The above is really confusing as to what is actually goin=
g on... does<br>that mean success? Does that mean there's no power? Does th=
at mean no<br>action was taken?<br><br><br>--<br>Stewart Smith<br>OPAL Arch=
itect, IBM.<br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt><t=
t><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlab=
s.org/listinfo/openbmc</a></tt><tt><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozl=
abs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">h=
ttps://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><br><BR>
</body></html>

--1__=C7BBF514DFEF8DC48f9e8a93df938690918cC7BBF514DFEF8DC4--


--0__=C7BBF514DFEF8DC48f9e8a93df938690918cC7BBF514DFEF8DC4
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=C7BBF514DFEF8DC48f9e8a93df938690918cC7B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=C7BBF514DFEF8DC48f9e8a93df938690918cC7BBF514DFEF8DC4--
