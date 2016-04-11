Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qk59d1K86zDq9q
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 19:58:29 +1000 (AEST)
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Mon, 11 Apr 2016 15:28:26 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 11 Apr 2016 15:28:24 +0530
X-IBM-Helo: d28relay05.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3B9wdj914614864
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 15:28:40 +0530
Message-Id: <201604110958.u3B9wdj914614864@d28relay05.in.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Mon, 11 Apr 2016 03:58:20 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 11 Apr 2016 03:58:18 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Mon, 11 Apr 2016 09:58:07 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 11 Apr 2016 09:55:14 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016041109550735-112751 ;
 Mon, 11 Apr 2016 09:55:07 +0000 
MIME-Version: 1.0
In-Reply-To: <1460337648-30919-8-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH skeleton v5 07/19] fix info memory leak
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC_Members@d28relay05.in.ibm.com
Cc: openbmc@lists.ozlabs.org, Ken <ken1029@gmail.com>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Mon, 11 Apr 2016 15:25:05 +0530
References: <1460337648-30919-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460337648-30919-8-git-send-email-openbmc-patches@stwcx.xyz>
X-KeepSent: EF13DF80:B202A7A9-65257F92:00362A75;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 54519
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF501DFA5ACE58f9e8a93df938690918cEABBF501DFA5ACE5"
Content-Disposition: inline
x-cbid: 16041109-0025-0000-0000-00000B3E3506
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0.035017; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005145; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000157; SDB=6.00686452; UDB=6.00315776; UTC=2016-04-11
 09:55:40
x-cbparentid: 16041109-5090-0000-0000-00000817462F
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
X-List-Received-Date: Mon, 11 Apr 2016 09:58:29 -0000


--0__=EABBF501DFA5ACE58f9e8a93df938690918cEABBF501DFA5ACE5
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

I remember reviewing a very similar code ( or perhaps the same ) in the
past. Is it a new patch now ?

Here is what I had sent before

a close(fd) on open failure may lead to unexpected behavior since the file
is not even opened.

Also, the pattern seems to be multiple error paths with same set of
instructions. Does it make sense to put them in a macro -or- better yet
have fd auto cleaned using the cleanup attribute ?

https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html

----------------------------------------------

"openbmc" <openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org> wrote =
on
11/04/2016 06:50:36 am:

> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Cc: Ken <ken1029@gmail.com>
> Date: 11/04/2016 06:51 am
> Subject: [PATCH skeleton v5 07/19] fix info memory leak
> Sent by: "openbmc" <openbmc-bounces
+vishwanath=3Din.ibm.com@lists.ozlabs.org>
>
> From: Ken <ken1029@gmail.com>
>
> ---
>  objects/info.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/objects/info.c b/objects/info.c
> index ab2d98c..d872c3f 100644
> --- a/objects/info.c
> +++ b/objects/info.c
> @@ -42,6 +42,7 @@ static int i2c=5Fopen() {
>    fd =3D open(fn, O=5FRDWR);
>    if (fd =3D=3D -1) {
>      LOG=5FERR(errno, "Failed to open i2c device %s", fn);
> +    close(fd);

I remember giving this same comment back the.. There is nothing to close if
open itself fails.

>      return -1;
>    }
>
> @@ -108,6 +109,7 @@ static int i2c=5Fio(int fd) {
>    rc =3D ioctl(fd, I2C=5FRDWR, &data);
>    if (rc < 0) {
>      LOG=5FERR(errno, "Failed to do raw io");
> +    close(fd);
>      return -1;
>    }
>
> @@ -126,6 +128,7 @@ int get=5Fhdd=5Fstatus(void)
>    }
>
>    if (i2c=5Fio(fd) < 0) {
> +    close(fd);
>      return -1;
>    }
>
> @@ -145,7 +148,7 @@ int get=5Fhdd=5Fstatus(void)
>
>      g=5Fread=5Ftmp[2]=3Dg=5Fread=5Fbytes[2];
>      g=5Fread=5Ftmp[3]=3Dg=5Fread=5Fbytes[3];
> -
> +    close(fd);
>  }
>
>  int send=5Fesel=5Fto=5Fdbus(const char *desc, const char *sev, const char
> *details, uint8=5Ft *debug, size=5Ft debuglen) {
> --
> 2.7.1
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=EABBF501DFA5ACE58f9e8a93df938690918cEABBF501DFA5ACE5
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>I remember reviewing a very similar code ( or perhaps th=
e same ) in the past. Is it a new patch now ?</tt><br><br><tt>Here is what =
I had sent before</tt><br><br><tt>a close(fd) on open failure may lead to u=
nexpected behavior since the file is not even opened.</tt><br><br><tt>Also,=
 the pattern seems to be multiple error paths with same set of instructions=
. Does it make sense to put them in a macro -or- better yet have fd auto cl=
eaned using the cleanup attribute ?</tt><br><br><a href=3D"https://gcc.gnu.=
org/onlinedocs/gcc/Common-Variable-Attributes.html"><tt>https://gcc.gnu.org=
/onlinedocs/gcc/Common-Variable-Attributes.html</tt></a><br><br>-----------=
-----------------------------------<br><br><tt>&quot;openbmc&quot; &lt;open=
bmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt; wrote on 11/04/201=
6 06:50:36 am:<br><br>&gt; From: OpenBMC Patches &lt;openbmc-patches@stwcx.=
xyz&gt;</tt><br><tt>&gt; To: openbmc@lists.ozlabs.org</tt><br><tt>&gt; Cc: =
Ken &lt;ken1029@gmail.com&gt;</tt><br><tt>&gt; Date: 11/04/2016 06:51 am</t=
t><br><tt>&gt; Subject: [PATCH skeleton v5 07/19] fix info memory leak</tt>=
<br><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3D=
in.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; From: Ken &lt;ken=
1029@gmail.com&gt;<br>&gt; <br>&gt; ---<br>&gt; &nbsp;objects/info.c | 5 ++=
++-<br>&gt; &nbsp;1 file changed, 4 insertions(+), 1 deletion(-)<br>&gt; <b=
r>&gt; diff --git a/objects/info.c b/objects/info.c<br>&gt; index ab2d98c..=
d872c3f 100644<br>&gt; --- a/objects/info.c<br>&gt; +++ b/objects/info.c<br=
>&gt; @@ -42,6 +42,7 @@ static int i2c=5Fopen() {<br>&gt; &nbsp; &nbsp;fd =
=3D open(fn, O=5FRDWR);<br>&gt; &nbsp; &nbsp;if (fd =3D=3D -1) {<br>&gt; &n=
bsp; &nbsp; &nbsp;LOG=5FERR(errno, &quot;Failed to open i2c device %s&quot;=
, fn);<br>&gt; + &nbsp; &nbsp;close(fd);</tt><br><br><tt>I remember giving =
this same comment back the.. There is nothing to close if open itself fails=
.</tt><br><tt><br>&gt; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &nbsp; &nbsp;=
}<br>&gt; &nbsp;<br>&gt; @@ -108,6 +109,7 @@ static int i2c=5Fio(int fd) {<=
br>&gt; &nbsp; &nbsp;rc =3D ioctl(fd, I2C=5FRDWR, &amp;data);<br>&gt; &nbsp=
; &nbsp;if (rc &lt; 0) {<br>&gt; &nbsp; &nbsp; &nbsp;LOG=5FERR(errno, &quot=
;Failed to do raw io&quot;);<br>&gt; + &nbsp; &nbsp;close(fd);<br>&gt; &nbs=
p; &nbsp; &nbsp;return -1;<br>&gt; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; @@=
 -126,6 +128,7 @@ int get=5Fhdd=5Fstatus(void)<br>&gt; &nbsp; &nbsp;}<br>&g=
t; &nbsp;<br>&gt; &nbsp; &nbsp;if (i2c=5Fio(fd) &lt; 0) {<br>&gt; + &nbsp; =
&nbsp;close(fd);<br>&gt; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &nbsp; &nbs=
p;}<br>&gt; &nbsp;<br>&gt; @@ -145,7 +148,7 @@ int get=5Fhdd=5Fstatus(void)=
<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;g=5Fread=5Ftmp[2]=3Dg=5Fread=5F=
bytes[2];<br>&gt; &nbsp; &nbsp; &nbsp;g=5Fread=5Ftmp[3]=3Dg=5Fread=5Fbytes[=
3];<br>&gt; -<br>&gt; + &nbsp; &nbsp;close(fd);<br>&gt; &nbsp;}<br>&gt; &nb=
sp;<br>&gt; &nbsp;int send=5Fesel=5Fto=5Fdbus(const char *desc, const char =
*sev, const char<br>&gt; *details, uint8=5Ft *debug, size=5Ft debuglen) {<b=
r>&gt; -- <br>&gt; 2.7.1<br>&gt; <br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>=
&gt; openbmc@lists.ozlabs.org<br>&gt; <a href=3D"https://lists.ozlabs.org/l=
istinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=EABBF501DFA5ACE58f9e8a93df938690918cEABBF501DFA5ACE5--
