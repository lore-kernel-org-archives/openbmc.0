Return-Path: <njames@us.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B076C1A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 15:45:32 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 11 Feb 2016 23:45:29 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 23:45:28 -0500
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id DF4126E803F
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 23:32:19 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1C4jRuZ31129622
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 04:45:27 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1C4jRUG016902
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 23:45:27 -0500
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1C4jQQs016805
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 23:45:27 -0500
Message-Id: <201602120445.u1C4jQQs016805@d01av04.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 11 Feb 2016 21:45:26 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 11 Feb 2016 21:45:25 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Fri, 12 Feb 2016 04:45:24 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 12 Feb 2016 04:45:21 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016021204471939-14972 ;
 Fri, 12 Feb 2016 04:47:19 +0000 
In-Reply-To: <1455179165-13252-2-git-send-email-jk@ozlabs.org>
Subject: Re: [RFC PATCH 2/2] serial/aspeed-vuart: Perform enable/disable on
 driver bind/unbind
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: "Norman James" <njames@us.ibm.com>
Date: Thu, 11 Feb 2016 22:45:09 -0600
References: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
 <1455179165-13252-2-git-send-email-jk@ozlabs.org>
X-KeepSent: 46181411:75E5169D-86257F57:0019350E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 65199
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF5C4DF8AB39E8f9e8a93df938690918c09BBF5C4DF8AB39E"
x-cbid: 16021204-0057-0000-0000-00000367F718
X-IBM-ISS-SpamDetectors: Score=0.410717; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004908; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000143; SDB=6.00658695; UDB=6.00299104; UTC=2016-02-12
 04:45:22
x-cbparentid: 16021204-4536-0000-0000-0000061D036E
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
X-List-Received-Date: Fri, 12 Feb 2016 04:45:33 -0000

--0__=09BBF5C4DF8AB39E8f9e8a93df938690918c09BBF5C4DF8AB39E
Content-type: multipart/alternative; 
	Boundary="1__=09BBF5C4DF8AB39E8f9e8a93df938690918c09BBF5C4DF8AB39E"


--1__=09BBF5C4DF8AB39E8f9e8a93df938690918c09BBF5C4DF8AB39E
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Having the driver handle the enable is better.   Looks good to me.


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Jeremy Kerr <jk@ozlabs.org>
To:	openbmc@lists.ozlabs.org
Date:	02/11/2016 03:03 AM
Subject:	[RFC PATCH 2/2] serial/aspeed-vuart: Perform enable/disable on
            driver bind/unbind
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



Rather than exposing an enable sysfs attribute, we can just set the
VUART enabled bit when we bind to the device, and clear it on unbind.

We don't want to do this on open/release, as the host may be using this
bit to configure serial output modes, which is independent of whether
the devices has been opened by BMC userspace.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Reviewed-by:  Norman James <nkskjames@gmail.com>
---
 drivers/tty/serial/aspeed-vuart.c | 53 ++++++++++
+----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/drivers/tty/serial/aspeed-vuart.c
b/drivers/tty/serial/aspeed-vuart.c
index 73bb0e7..020c815 100644
--- a/drivers/tty/serial/aspeed-vuart.c
+++ b/drivers/tty/serial/aspeed-vuart.c
@@ -35,42 +35,6 @@ struct ast=5Fvuart {
 		 int		 		 		 line;
 };

-static ssize=5Ft ast=5Fvuart=5Fshow=5Fenabled(struct device *dev,
-		 		 struct device=5Fattribute *attr, char *buf)
-{
-		 struct ast=5Fvuart *vuart =3D dev=5Fget=5Fdrvdata(dev);
-		 u8 reg;
-
-		 reg =3D readb(vuart->regs + AST=5FVUART=5FGCRA) &
AST=5FVUART=5FGCRA=5FVUART=5FEN;
-
-		 return snprintf(buf, PAGE=5FSIZE - 1, "%u\n", reg ? 1 : 0);
-}
-
-static ssize=5Ft ast=5Fvuart=5Fset=5Fenabled(struct device *dev,
-		 		 struct device=5Fattribute *attr,
-		 		 const char *buf, size=5Ft count)
-{
-		 struct ast=5Fvuart *vuart =3D dev=5Fget=5Fdrvdata(dev);
-		 unsigned long val;
-		 int err;
-		 u8 reg;
-
-		 err =3D kstrtoul(buf, 0, &val);
-		 if (err)
-		 		 return err;
-
-		 reg =3D readb(vuart->regs + AST=5FVUART=5FGCRA);
-		 reg &=3D ~AST=5FVUART=5FGCRA=5FVUART=5FEN;
-		 if (val)
-		 		 reg |=3D AST=5FVUART=5FGCRA=5FVUART=5FEN;
-		 writeb(reg, vuart->regs + AST=5FVUART=5FGCRA);
-
-		 return count;
-}
-
-static DEVICE=5FATTR(enabled, S=5FIWUSR | S=5FIRUGO,
-		 		 ast=5Fvuart=5Fshow=5Fenabled, ast=5Fvuart=5Fset=5Fenabled);
-
 static ssize=5Ft ast=5Fvuart=5Fshow=5Faddr(struct device *dev,
 		 		 struct device=5Fattribute *attr, char *buf)
 {
@@ -144,6 +108,17 @@ static ssize=5Ft ast=5Fvuart=5Fset=5Fsirq(struct devic=
e *dev,
 static DEVICE=5FATTR(sirq, S=5FIWUSR | S=5FIRUGO,
 		 		 ast=5Fvuart=5Fshow=5Fsirq, ast=5Fvuart=5Fset=5Fsirq);

+static void ast=5Fvuart=5Fset=5Fenabled(struct ast=5Fvuart *vuart, bool en=
abled)
+{
+		 u8 reg;
+
+		 reg =3D readb(vuart->regs + AST=5FVUART=5FGCRA);
+		 reg &=3D ~AST=5FVUART=5FGCRA=5FVUART=5FEN;
+		 if (enabled)
+		 		 reg |=3D AST=5FVUART=5FGCRA=5FVUART=5FEN;
+		 writeb(reg, vuart->regs + AST=5FVUART=5FGCRA);
+}
+
 static void ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(struct ast=5Fvuart *vu=
art, bool
discard)
 {
 		 u8 reg;
@@ -304,6 +279,7 @@ static int ast=5Fvuart=5Fprobe(struct platform=5Fdevice
*pdev)


 		 vuart->line =3D rc;
+		 ast=5Fvuart=5Fset=5Fenabled(vuart, true);
 		 ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(vuart, true);
 		 platform=5Fset=5Fdrvdata(pdev, vuart);

@@ -314,9 +290,6 @@ static int ast=5Fvuart=5Fprobe(struct platform=5Fdevice
*pdev)
 		 rc =3D device=5Fcreate=5Ffile(&pdev->dev, &dev=5Fattr=5Fsirq);
 		 if (rc)
 		 		 dev=5Fwarn(&pdev->dev, "can't create sirq file\n");
-		 rc =3D device=5Fcreate=5Ffile(&pdev->dev, &dev=5Fattr=5Fenabled);
-		 if (rc)
-		 		 dev=5Fwarn(&pdev->dev, "can't create enabled file
\n");

 		 return 0;

@@ -332,6 +305,8 @@ static int ast=5Fvuart=5Fremove(struct platform=5Fdevice
*pdev)
 {
 		 struct ast=5Fvuart *vuart =3D platform=5Fget=5Fdrvdata(pdev);

+		 ast=5Fvuart=5Fset=5Fenabled(vuart, false);
+
 		 if (vuart->clk)
 		 		 clk=5Fdisable=5Funprepare(vuart->clk);
 		 return 0;
--
2.5.0

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF5C4DF8AB39E8f9e8a93df938690918c09BBF5C4DF8AB39E
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Having the driver handle the enable is better.   Looks good =
to me.<br><br><br>Regards,<br>Norman James<br>IBM - POWER Systems Architect=
<br>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Internet: njames@us.ibm.com<br=
><br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09BBF5C4DF8AB=
39E8f9e8a93df938690918c09B@" border=3D"0" alt=3D"Inactive hide details for =
Jeremy Kerr ---02/11/2016 03:03:22 AM---Rather than exposing an enable sysf=
s attribute, we can just s"><font color=3D"#424282">Jeremy Kerr ---02/11/20=
16 03:03:22 AM---Rather than exposing an enable sysfs attribute, we can jus=
t set the VUART enabled bit when we bind t</font><br><br><font size=3D"2" c=
olor=3D"#5F5F5F">From:        </font><font size=3D"2">Jeremy Kerr &lt;jk@oz=
labs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font=
><font size=3D"2">openbmc@lists.ozlabs.org</font><br><font size=3D"2" color=
=3D"#5F5F5F">Date:        </font><font size=3D"2">02/11/2016 03:03 AM</font=
><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=
=3D"2">[RFC PATCH 2/2] serial/aspeed-vuart: Perform enable/disable on drive=
r bind/unbind</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        =
</font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=3Dus=
.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=
=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>Rather than exp=
osing an enable sysfs attribute, we can just set the<br>VUART enabled bit w=
hen we bind to the device, and clear it on unbind.<br><br>We don't want to =
do this on open/release, as the host may be using this<br>bit to configure =
serial output modes, which is independent of whether<br>the devices has bee=
n opened by BMC userspace.<br><br>Signed-off-by: Jeremy Kerr &lt;jk@ozlabs.=
org&gt;</tt><br><tt>Reviewed-by: &nbsp;Norman James &lt;nkskjames@gmail.com=
&gt;<br>---<br> drivers/tty/serial/aspeed-vuart.c | 53 +++++++++++---------=
-------------------<br> 1 file changed, 14 insertions(+), 39 deletions(-)<b=
r><br>diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/a=
speed-vuart.c<br>index 73bb0e7..020c815 100644<br>--- a/drivers/tty/serial/=
aspeed-vuart.c<br>+++ b/drivers/tty/serial/aspeed-vuart.c<br>@@ -35,42 +35,=
6 @@ struct ast=5Fvuart {<br>                  int                         =
                          line;<br> };<br> <br>-static ssize=5Ft ast=5Fvuar=
t=5Fshow=5Fenabled(struct device *dev,<br>-                                =
  struct device=5Fattribute *attr, char *buf)<br>-{<br>-                 st=
ruct ast=5Fvuart *vuart =3D dev=5Fget=5Fdrvdata(dev);<br>-                 =
u8 reg;<br>-<br>-                 reg =3D readb(vuart-&gt;regs + AST=5FVUAR=
T=5FGCRA) &amp; AST=5FVUART=5FGCRA=5FVUART=5FEN;<br>-<br>-                 =
return snprintf(buf, PAGE=5FSIZE - 1, &quot;%u\n&quot;, reg ? 1 : 0);<br>-}=
<br>-<br>-static ssize=5Ft ast=5Fvuart=5Fset=5Fenabled(struct device *dev,<=
br>-                                  struct device=5Fattribute *attr,<br>-=
                                  const char *buf, size=5Ft count)<br>-{<br=
>-                 struct ast=5Fvuart *vuart =3D dev=5Fget=5Fdrvdata(dev);<=
br>-                 unsigned long val;<br>-                 int err;<br>- =
                u8 reg;<br>-<br>-                 err =3D kstrtoul(buf, 0, =
&amp;val);<br>-                 if (err)<br>-                              =
    return err;<br>-<br>-                 reg =3D readb(vuart-&gt;regs + AS=
T=5FVUART=5FGCRA);<br>-                 reg &amp;=3D ~AST=5FVUART=5FGCRA=5F=
VUART=5FEN;<br>-                 if (val)<br>-                             =
     reg |=3D AST=5FVUART=5FGCRA=5FVUART=5FEN;<br>-                 writeb(=
reg, vuart-&gt;regs + AST=5FVUART=5FGCRA);<br>-<br>-                 return=
 count;<br>-}<br>-<br>-static DEVICE=5FATTR(enabled, S=5FIWUSR | S=5FIRUGO,=
<br>-                                  ast=5Fvuart=5Fshow=5Fenabled, ast=5F=
vuart=5Fset=5Fenabled);<br>-<br> static ssize=5Ft ast=5Fvuart=5Fshow=5Faddr=
(struct device *dev,<br>                                   struct device=5F=
attribute *attr, char *buf)<br> {<br>@@ -144,6 +108,17 @@ static ssize=5Ft =
ast=5Fvuart=5Fset=5Fsirq(struct device *dev,<br> static DEVICE=5FATTR(sirq,=
 S=5FIWUSR | S=5FIRUGO,<br>                                   ast=5Fvuart=
=5Fshow=5Fsirq, ast=5Fvuart=5Fset=5Fsirq);<br> <br>+static void ast=5Fvuart=
=5Fset=5Fenabled(struct ast=5Fvuart *vuart, bool enabled)<br>+{<br>+       =
          u8 reg;<br>+<br>+                 reg =3D readb(vuart-&gt;regs + =
AST=5FVUART=5FGCRA);<br>+                 reg &amp;=3D ~AST=5FVUART=5FGCRA=
=5FVUART=5FEN;<br>+                 if (enabled)<br>+                      =
            reg |=3D AST=5FVUART=5FGCRA=5FVUART=5FEN;<br>+                 =
writeb(reg, vuart-&gt;regs + AST=5FVUART=5FGCRA);<br>+}<br>+<br> static voi=
d ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fdiscard(struct ast=5Fvuart *vuart, bool d=
iscard)<br> {<br>                  u8 reg;<br>@@ -304,6 +279,7 @@ static in=
t ast=5Fvuart=5Fprobe(struct platform=5Fdevice *pdev)<br> <br> <br>        =
          vuart-&gt;line =3D rc;<br>+                 ast=5Fvuart=5Fset=5Fe=
nabled(vuart, true);<br>                  ast=5Fvuart=5Fset=5Fhost=5Ftx=5Fd=
iscard(vuart, true);<br>                  platform=5Fset=5Fdrvdata(pdev, vu=
art);<br> <br>@@ -314,9 +290,6 @@ static int ast=5Fvuart=5Fprobe(struct pla=
tform=5Fdevice *pdev)<br>                  rc =3D device=5Fcreate=5Ffile(&a=
mp;pdev-&gt;dev, &amp;dev=5Fattr=5Fsirq);<br>                  if (rc)<br> =
                                  dev=5Fwarn(&amp;pdev-&gt;dev, &quot;can't=
 create sirq file\n&quot;);<br>-                 rc =3D device=5Fcreate=5Ff=
ile(&amp;pdev-&gt;dev, &amp;dev=5Fattr=5Fenabled);<br>-                 if =
(rc)<br>-                                  dev=5Fwarn(&amp;pdev-&gt;dev, &q=
uot;can't create enabled file\n&quot;);<br> <br>                  return 0;=
<br> <br>@@ -332,6 +305,8 @@ static int ast=5Fvuart=5Fremove(struct platfor=
m=5Fdevice *pdev)<br> {<br>                  struct ast=5Fvuart *vuart =3D =
platform=5Fget=5Fdrvdata(pdev);<br> <br>+                 ast=5Fvuart=5Fset=
=5Fenabled(vuart, false);<br>+<br>                  if (vuart-&gt;clk)<br> =
                                  clk=5Fdisable=5Funprepare(vuart-&gt;clk);=
<br>                  return 0;<br>-- <br>2.5.0<br><br>=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br=
>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/l=
istinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br>=
</tt><br><BR>
</body></html>

--1__=09BBF5C4DF8AB39E8f9e8a93df938690918c09BBF5C4DF8AB39E--


--0__=09BBF5C4DF8AB39E8f9e8a93df938690918c09BBF5C4DF8AB39E
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF5C4DF8AB39E8f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF5C4DF8AB39E8f9e8a93df938690918c09BBF5C4DF8AB39E--
