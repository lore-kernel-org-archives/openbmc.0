Return-Path: <austenc@us.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CEE3E1A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 14:12:23 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 11 Feb 2016 20:12:21 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 20:12:19 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id D0F6019D803E
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 20:00:16 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1C3CIl030867598
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 20:12:18 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1C3CII7030263
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 20:12:18 -0700
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1C3CHKi030217
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 20:12:17 -0700
Message-Id: <201602120312.u1C3CHKi030217@d03av03.boulder.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 11 Feb 2016 22:12:17 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 11 Feb 2016 22:12:15 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 12 Feb 2016 03:12:14 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 12 Feb 2016 03:12:11 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016021203121067-560330 ;
 Fri, 12 Feb 2016 03:12:10 +0000 
To: "andrew@aj.id.au" <andrew@aj.id.au>
In-Reply-To: <1455232163.2576.27.camel@aj.id.au>
Date: Fri, 12 Feb 2016 03:12:11 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
Cc: "openbmc-patches" <openbmc-patches@stwcx.xyz>, "openbmc"
 <openbmc@lists.ozlabs.org>, "Stewart Smith" <stewart@linux.vnet.ibm.com>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.10 Build 201602011006_20 on behalf of device with
 id mdmxxIBM_IOS_ApplFFMQ18K3G5MD,
 type 1600 (iosibm) and description iPhone 6:Apple
 iOS 9.2.1:IBM Traveler/9.3.1.20160121
X-KeepSent: AECB91A3:1F241BDA-00257F57:0011985F;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 26043
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_316_984234666.1455246731316"
x-cbid: 16021203-0025-0000-0000-0000214DF4DC
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004906; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000143; SDB=6.00658667; UDB=6.00299087; UTC=2016-02-12
 03:12:13
x-cbparentid: 16021203-0598-0000-0000-00000661B8E0
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
X-List-Received-Date: Fri, 12 Feb 2016 03:12:24 -0000


------=_Part_316_984234666.1455246731316
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Would it make sense to integrate gerrit?  =0A   =0A    I love the review I'=
m all for it.  I asked for the issue because I knew it was merged. No issue=
s at all with comments. =0A    =0A    I've work a project with gerrit and i=
t seems that would resolve the issue with losing context=0A  =0A  Sent from=
 my iPhone using IBM Verse=0A  =0A  On Feb 11, 2016, 5:09:41 PM, "Andrew Je=
ffery" <andrew@aj.id.au> wrote:=0A  =0A     On Fri, 2016-02-12 at 08:15 +11=
00, Stewart Smith wrote:=0A   > Chris Austen  writes:=0A   > > Open an issu=
e to migrate to inet=5Fpton.=0A   > =0A   > Fixing such things in code revi=
ew is a much better approach.=0A   > =0A   > For the submitter, it helps ge=
t quick feedback on tehir code, and=0A   > promotes a culture of examining =
your own code closely for things before=0A   > submitting it.=0A   > =0A   =
> For maintainers and those who hare going to have to debug the systems,=0A=
   > it means that it's *very* quick and cheap (in time) to point out odd=
=0A   > things.=0A   > =0A   > Opening issues is approximately an order of =
magnitude slower.=0A   For transparency, I sent the email despite knowing t=
he code had been=0A   merged at the point I hit send because the timeline w=
ent along the=0A   lines of: Open my laptop for the day, start reading emai=
l, come across=0A   the patch, find some areas that I think we can improve =
on, write 90% of=0A   the reply, head to github to check a small detail, di=
scover the patch=0A   has already been merged.=0A   Since I'd spent some ti=
me composing the review I didn't want to throw=0A   it away or spend furthe=
r time to massaging it into a github issue with=0A   the necessary context,=
 so I reworded the first paragraph to reflect the=0A   fact that it was alr=
eady merged and hit send. This dovetails into=0A   Stewart's point below, p=
rimarily the one about github issues lacking=0A   the code context for the =
comments (without some manual effort). To be=0A   fair as it stands the git=
hub issue I created doesn't (yet) contain any=0A   of the context or commen=
ts provided in the email review, but at least=0A   that's available through=
 the list archives (and can be easily linked in=0A   a comment).=0A   Maybe=
 this should be a separate thread, but anyway: I find the mailing=0A   -lis=
t/github split a little awkward - is there a way we can improve=0A   this? =
Use one xor the other?=0A   Andrew=0A   > =0A   > I can hit reply, type ten=
 words and hit send in maybe a few seconds. For=0A   > an issue, you're add=
ing a couple of seconds in network round trip to=0A   > browse to the proje=
ct, go to issues, click create issue, then type a=0A   > whole description =
of the problem because you don't have the context of=0A   > what you're try=
ing to reply to, and then manage the issue by adding=0A   > tags, target re=
leases, closing it when something is finally merged (and=0A   > having the =
submitter have to open another pull request and keep track of=0A   > it)...=
 Urgh.=0A   > =0A   > Good code review provides a positive feedback loop of=
 improvement to=0A   > code with a positive reinforcement at the end of "pa=
tch merged!"=0A   > Contrast this to the negative re-inforcement of filing =
bugs, of which=0A   > there is little to no direct motivation for the code =
author to go and fix.=0A   >

------=_Part_316_984234666.1455246731316
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">Would it make sense to integrate gerrit? &nbsp;<div><br></=
div><div>I love the review I'm all for it. &nbsp;I asked for the issue beca=
use I knew it was merged. No issues at all with comments.&nbsp;</div><div><=
br></div><div>I've work a project with gerrit and it seems that would resol=
ve the issue with losing context<br><br>Sent from my iPhone using IBM Verse=
<br><br><hr>On Feb 11, 2016, 5:09:41 PM, "Andrew Jeffery" &lt;andrew@aj.id.=
au&gt; wrote:<br><div style=3D"margin-left: 15px;" id=3D"MaaS360PIMSDKOrigi=
nalMessageId">On&nbsp;Fri,&nbsp;2016-02-12&nbsp;at&nbsp;08:15&nbsp;+1100,&n=
bsp;Stewart&nbsp;Smith&nbsp;wrote:<br>&gt;&nbsp;Chris&nbsp;Austen&nbsp;<aus=
tenc@us.ibm.com>&nbsp;writes:<br>&gt;&nbsp;&gt;&nbsp;Open&nbsp;an&nbsp;issu=
e&nbsp;to&nbsp;migrate&nbsp;to&nbsp;inet=5Fpton.<br>&gt;&nbsp;<br>&gt;&nbsp=
;Fixing&nbsp;such&nbsp;things&nbsp;in&nbsp;code&nbsp;review&nbsp;is&nbsp;a&=
nbsp;much&nbsp;better&nbsp;approach.<br>&gt;&nbsp;<br>&gt;&nbsp;For&nbsp;th=
e&nbsp;submitter,&nbsp;it&nbsp;helps&nbsp;get&nbsp;quick&nbsp;feedback&nbsp=
;on&nbsp;tehir&nbsp;code,&nbsp;and<br>&gt;&nbsp;promotes&nbsp;a&nbsp;cultur=
e&nbsp;of&nbsp;examining&nbsp;your&nbsp;own&nbsp;code&nbsp;closely&nbsp;for=
&nbsp;things&nbsp;before<br>&gt;&nbsp;submitting&nbsp;it.<br>&gt;&nbsp;<br>=
&gt;&nbsp;For&nbsp;maintainers&nbsp;and&nbsp;those&nbsp;who&nbsp;hare&nbsp;=
going&nbsp;to&nbsp;have&nbsp;to&nbsp;debug&nbsp;the&nbsp;systems,<br>&gt;&n=
bsp;it&nbsp;means&nbsp;that&nbsp;it's&nbsp;*very*&nbsp;quick&nbsp;and&nbsp;=
cheap&nbsp;(in&nbsp;time)&nbsp;to&nbsp;point&nbsp;out&nbsp;odd<br>&gt;&nbsp=
;things.<br>&gt;&nbsp;<br>&gt;&nbsp;Opening&nbsp;issues&nbsp;is&nbsp;approx=
imately&nbsp;an&nbsp;order&nbsp;of&nbsp;magnitude&nbsp;slower.<br>For&nbsp;=
transparency,&nbsp;I&nbsp;sent&nbsp;the&nbsp;email&nbsp;despite&nbsp;knowin=
g&nbsp;the&nbsp;code&nbsp;had&nbsp;been<br>merged&nbsp;at&nbsp;the&nbsp;poi=
nt&nbsp;I&nbsp;hit&nbsp;send&nbsp;because&nbsp;the&nbsp;timeline&nbsp;went&=
nbsp;along&nbsp;the<br>lines&nbsp;of:&nbsp;Open&nbsp;my&nbsp;laptop&nbsp;fo=
r&nbsp;the&nbsp;day,&nbsp;start&nbsp;reading&nbsp;email,&nbsp;come&nbsp;acr=
oss<br>the&nbsp;patch,&nbsp;find&nbsp;some&nbsp;areas&nbsp;that&nbsp;I&nbsp=
;think&nbsp;we&nbsp;can&nbsp;improve&nbsp;on,&nbsp;write&nbsp;90%&nbsp;of<b=
r>the&nbsp;reply,&nbsp;head&nbsp;to&nbsp;github&nbsp;to&nbsp;check&nbsp;a&n=
bsp;small&nbsp;detail,&nbsp;discover&nbsp;the&nbsp;patch<br>has&nbsp;alread=
y&nbsp;been&nbsp;merged.<br>Since&nbsp;I'd&nbsp;spent&nbsp;some&nbsp;time&n=
bsp;composing&nbsp;the&nbsp;review&nbsp;I&nbsp;didn't&nbsp;want&nbsp;to&nbs=
p;throw<br>it&nbsp;away&nbsp;or&nbsp;spend&nbsp;further&nbsp;time&nbsp;to&n=
bsp;massaging&nbsp;it&nbsp;into&nbsp;a&nbsp;github&nbsp;issue&nbsp;with<br>=
the&nbsp;necessary&nbsp;context,&nbsp;so&nbsp;I&nbsp;reworded&nbsp;the&nbsp=
;first&nbsp;paragraph&nbsp;to&nbsp;reflect&nbsp;the<br>fact&nbsp;that&nbsp;=
it&nbsp;was&nbsp;already&nbsp;merged&nbsp;and&nbsp;hit&nbsp;send.&nbsp;This=
&nbsp;dovetails&nbsp;into<br>Stewart's&nbsp;point&nbsp;below,&nbsp;primaril=
y&nbsp;the&nbsp;one&nbsp;about&nbsp;github&nbsp;issues&nbsp;lacking<br>the&=
nbsp;code&nbsp;context&nbsp;for&nbsp;the&nbsp;comments&nbsp;(without&nbsp;s=
ome&nbsp;manual&nbsp;effort).&nbsp;To&nbsp;be<br>fair&nbsp;as&nbsp;it&nbsp;=
stands&nbsp;the&nbsp;github&nbsp;issue&nbsp;I&nbsp;created&nbsp;doesn't&nbs=
p;(yet)&nbsp;contain&nbsp;any<br>of&nbsp;the&nbsp;context&nbsp;or&nbsp;comm=
ents&nbsp;provided&nbsp;in&nbsp;the&nbsp;email&nbsp;review,&nbsp;but&nbsp;a=
t&nbsp;least<br>that's&nbsp;available&nbsp;through&nbsp;the&nbsp;list&nbsp;=
archives&nbsp;(and&nbsp;can&nbsp;be&nbsp;easily&nbsp;linked&nbsp;in<br>a&nb=
sp;comment).<br>Maybe&nbsp;this&nbsp;should&nbsp;be&nbsp;a&nbsp;separate&nb=
sp;thread,&nbsp;but&nbsp;anyway:&nbsp;I&nbsp;find&nbsp;the&nbsp;mailing<br>=
-list/github&nbsp;split&nbsp;a&nbsp;little&nbsp;awkward&nbsp;-&nbsp;is&nbsp=
;there&nbsp;a&nbsp;way&nbsp;we&nbsp;can&nbsp;improve<br>this?&nbsp;Use&nbsp=
;one&nbsp;xor&nbsp;the&nbsp;other?<br>Andrew<br>&gt;&nbsp;<br>&gt;&nbsp;I&n=
bsp;can&nbsp;hit&nbsp;reply,&nbsp;type&nbsp;ten&nbsp;words&nbsp;and&nbsp;hi=
t&nbsp;send&nbsp;in&nbsp;maybe&nbsp;a&nbsp;few&nbsp;seconds.&nbsp;For<br>&g=
t;&nbsp;an&nbsp;issue,&nbsp;you're&nbsp;adding&nbsp;a&nbsp;couple&nbsp;of&n=
bsp;seconds&nbsp;in&nbsp;network&nbsp;round&nbsp;trip&nbsp;to<br>&gt;&nbsp;=
browse&nbsp;to&nbsp;the&nbsp;project,&nbsp;go&nbsp;to&nbsp;issues,&nbsp;cli=
ck&nbsp;create&nbsp;issue,&nbsp;then&nbsp;type&nbsp;a<br>&gt;&nbsp;whole&nb=
sp;description&nbsp;of&nbsp;the&nbsp;problem&nbsp;because&nbsp;you&nbsp;don=
't&nbsp;have&nbsp;the&nbsp;context&nbsp;of<br>&gt;&nbsp;what&nbsp;you're&nb=
sp;trying&nbsp;to&nbsp;reply&nbsp;to,&nbsp;and&nbsp;then&nbsp;manage&nbsp;t=
he&nbsp;issue&nbsp;by&nbsp;adding<br>&gt;&nbsp;tags,&nbsp;target&nbsp;relea=
ses,&nbsp;closing&nbsp;it&nbsp;when&nbsp;something&nbsp;is&nbsp;finally&nbs=
p;merged&nbsp;(and<br>&gt;&nbsp;having&nbsp;the&nbsp;submitter&nbsp;have&nb=
sp;to&nbsp;open&nbsp;another&nbsp;pull&nbsp;request&nbsp;and&nbsp;keep&nbsp=
;track&nbsp;of<br>&gt;&nbsp;it)...&nbsp;Urgh.<br>&gt;&nbsp;<br>&gt;&nbsp;Go=
od&nbsp;code&nbsp;review&nbsp;provides&nbsp;a&nbsp;positive&nbsp;feedback&n=
bsp;loop&nbsp;of&nbsp;improvement&nbsp;to<br>&gt;&nbsp;code&nbsp;with&nbsp;=
a&nbsp;positive&nbsp;reinforcement&nbsp;at&nbsp;the&nbsp;end&nbsp;of&nbsp;"=
patch&nbsp;merged!"<br>&gt;&nbsp;Contrast&nbsp;this&nbsp;to&nbsp;the&nbsp;n=
egative&nbsp;re-inforcement&nbsp;of&nbsp;filing&nbsp;bugs,&nbsp;of&nbsp;whi=
ch<br>&gt;&nbsp;there&nbsp;is&nbsp;little&nbsp;to&nbsp;no&nbsp;direct&nbsp;=
motivation&nbsp;for&nbsp;the&nbsp;code&nbsp;author&nbsp;to&nbsp;go&nbsp;and=
&nbsp;fix.<br>&gt;&nbsp;<br></austenc@us.ibm.com></div></div></div><BR>
</body></html>

------=_Part_316_984234666.1455246731316--
