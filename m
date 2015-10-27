Return-Path: <njames@us.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ADB81A048B
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:32:03 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Tue, 27 Oct 2015 07:32:01 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 27 Oct 2015 07:31:59 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 1F04D3E4003B
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2015 07:31:59 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9RDUrjs3932602
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2015 06:30:53 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9RDVwOJ017124
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2015 07:31:58 -0600
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 t9RDVvi1017078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2015 07:31:58 -0600
Message-Id: <201510271331.t9RDVvi1017078@d03av03.boulder.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Tue, 27 Oct 2015 09:29:45 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 27 Oct 2015 09:29:41 -0400
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Tue, 27 Oct 2015 13:28:53 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 27 Oct 2015 13:28:50 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015102713285500-297503 ;
 Tue, 27 Oct 2015 13:28:55 +0000 
In-Reply-To: <1445951600-17505-3-git-send-email-patches@stwcx.xyz>
Subject: Re: [PATCH linux 2/3] gpio/aspeed: Expose entire bank as one gpio chip
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
From: "Norman James" <njames@us.ibm.com>
Date: Tue, 27 Oct 2015 07:28:23 -0600
References: <1445951600-17505-1-git-send-email-patches@stwcx.xyz>
 <1445951600-17505-3-git-send-email-patches@stwcx.xyz>
X-KeepSent: 207C91BC:1AA8DE8E-86257EEB:0049E2AB;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 11683
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF478DFDA643B8f9e8a93df938690918c09BBF478DFDA643B"
x-cbid: 15102713-0021-0000-0000-000014046675
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.281217; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004539; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00608747; UDB=6.00268481; UTC=2015-10-27
 13:28:52
x-cbparentid: 15102713-5938-0000-0000-000000B40DFD
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
X-List-Received-Date: Tue, 27 Oct 2015 13:32:03 -0000

--0__=09BBF478DFDA643B8f9e8a93df938690918c09BBF478DFDA643B
Content-type: multipart/alternative; 
	Boundary="1__=09BBF478DFDA643B8f9e8a93df938690918c09BBF478DFDA643B"


--1__=09BBF478DFDA643B8f9e8a93df938690918c09BBF478DFDA643B
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Will the old gpio #'s still work with this?   Can I export by gpio pin
name?  echo "A3" > /sys/class/gpio/export?




From:	OpenBMC Patches <patches@stwcx.xyz>
To:	openbmc@lists.ozlabs.org
Date:	10/27/2015 08:14 AM
Subject:	[PATCH linux 2/3] gpio/aspeed: Expose entire bank as one gpio
            chip
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  29 +------
 drivers/gpio/gpio-aspeed.c                    | 106 ++++++++++++++++++++++
+---
 2 files changed, 98 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index d90e4ba..e63ddb9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -145,34 +145,9 @@
 		 		 		 		 clocks =3D <&clk=5Fapb>;
 		 		 		 };

-		 		 		 gpio0: gpio@1e780000 {
+		 		 		 gpio: gpio@1e780000 {
 		 		 		        compatible =3D
"aspeed,ast2400-gpio";
-		 		 		        reg =3D <0x1e780000 0x20>;
-		 		 		 };
-
-		 		 		 gpio1: gpio@1e780020 {
-		 		 		        compatible =3D
"aspeed,ast2400-gpio";
-		 		 		        reg =3D <0x1e780020 0x20>;
-		 		 		 };
-
-		 		 		 gpio2: gpio@1e780070 {
-		 		 		        compatible =3D
"aspeed,ast2400-gpio";
-		 		 		        reg =3D <0x1e780070 0x8>;
-		 		 		 };
-
-		 		 		 gpio3: gpio@1e780078 {
-		 		 		        compatible =3D
"aspeed,ast2400-gpio";
-		 		 		        reg =3D <0x1e780078 0x8>;
-		 		 		 };
-
-		 		 		 gpio4: gpio@1e780080 {
-		 		 		        compatible =3D
"aspeed,ast2400-gpio";
-		 		 		        reg =3D <0x1e780080 0x8>;
-		 		 		 };
-
-		 		 		 gpio5: gpio@1e780088 {
-		 		 		        compatible =3D
"aspeed,ast2400-gpio";
-		 		 		        reg =3D <0x1e780088 0x8>;
+		 		 		        reg =3D <0x1e780000 0x1000>;
 		 		 		 };

 		 		 		 uart1: serial@1e783000 {
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index f347260..8295371 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -23,6 +23,42 @@ struct aspeed=5Fgpio {
 		 void =5F=5Fiomem *base;
 };

+struct aspeed=5Fgpio=5Fbank {
+		 uint16=5Ft		 val=5Fregs;
+		 char		 		 names[4];
+};
+
+static struct aspeed=5Fgpio=5Fbank aspeed=5Fgpio=5Fbanks[] =3D {
+		 {
+		 		 .val=5Fregs =3D 0x0000,
+		 		 .names =3D { 'A', 'B', 'C', 'D' },
+		 },
+		 {
+		 		 .val=5Fregs =3D 0x0020,
+		 		 .names =3D { 'E', 'F', 'G', 'H' },
+		 },
+		 {
+		 		 .val=5Fregs =3D 0x0070,
+		 		 .names =3D { 'I', 'J', 'K', 'L' },
+		 },
+		 {
+		 		 .val=5Fregs =3D 0x0078,
+		 		 .names =3D { 'M', 'N', 'O', 'P' },
+		 },
+		 {
+		 		 .val=5Fregs =3D 0x0080,
+		 		 .names =3D { 'Q', 'R', 'S', 'T' },
+		 },
+		 {
+		 		 .val=5Fregs =3D 0x0088,
+		 		 .names =3D { 'U', 'V', 'W', 'X' },
+		 },
+};
+
+#define GPIO=5FBANK(x)		 ((x) >> 5)
+#define GPIO=5FOFFSET(x)		 ((x) & 0x1f)
+#define GPIO=5FBIT(x)		 BIT(GPIO=5FOFFSET(x))
+
 #define GPIO=5FDATA		 0x00
 #define GPIO=5FDIR		 0x04

@@ -31,29 +67,46 @@ static inline struct aspeed=5Fgpio *to=5Faspeed=5Fgpio(=
struct
gpio=5Fchip *chip)
 		 return container=5Fof(chip, struct aspeed=5Fgpio, chip);
 }

+static struct aspeed=5Fgpio=5Fbank *to=5Fbank(unsigned int offset)
+{
+		 unsigned int bank =3D GPIO=5FBANK(offset);
+		 WARN=5FON(bank > ARRAY=5FSIZE(aspeed=5Fgpio=5Fbanks));
+		 return &aspeed=5Fgpio=5Fbanks[bank];
+}
+
+static void *bank=5Fval=5Freg(struct aspeed=5Fgpio *gpio,
+		 		 struct aspeed=5Fgpio=5Fbank *bank,
+		 		 unsigned int reg)
+{
+		 return gpio->base + bank->val=5Fregs + reg;
+}
+
 static int aspeed=5Fgpio=5Fget(struct gpio=5Fchip *gc, unsigned int offset)
 {
 		 struct aspeed=5Fgpio *gpio =3D to=5Faspeed=5Fgpio(gc);
+		 struct aspeed=5Fgpio=5Fbank *bank =3D to=5Fbank(offset);

-		 return !!(ioread32(gpio->base + GPIO=5FDATA) & BIT(offset));
+		 return !!(ioread32(bank=5Fval=5Freg(gpio, bank, GPIO=5FDATA))
+		 		 		 & GPIO=5FBIT(offset));
 }

 static void aspeed=5Fgpio=5Fset(struct gpio=5Fchip *gc, unsigned int offse=
t,
 		 		 		     int val)
 {
 		 struct aspeed=5Fgpio *gpio =3D to=5Faspeed=5Fgpio(gc);
+		 struct aspeed=5Fgpio=5Fbank *bank =3D to=5Fbank(offset);
 		 unsigned long flags;
 		 u32 reg;

 		 spin=5Flock=5Firqsave(&gpio->lock, flags);

-		 reg =3D ioread32(gpio->base + GPIO=5FDATA);
+		 reg =3D ioread32(bank=5Fval=5Freg(gpio, bank, GPIO=5FDATA));
 		 if (val)
-		 		 reg |=3D BIT(offset);
+		 		 reg |=3D GPIO=5FBIT(offset);
 		 else
-		 		 reg &=3D ~BIT(offset);
+		 		 reg &=3D ~GPIO=5FBIT(offset);

-		 iowrite32(reg, gpio->base + GPIO=5FDATA);
+		 iowrite32(reg, bank=5Fval=5Freg(gpio, bank, GPIO=5FDATA));

 		 spin=5Funlock=5Firqrestore(&gpio->lock, flags);
 }
@@ -61,13 +114,14 @@ static void aspeed=5Fgpio=5Fset(struct gpio=5Fchip *gc,
unsigned int offset,
 static int aspeed=5Fgpio=5Fdir=5Fin(struct gpio=5Fchip *gc, unsigned int o=
ffset)
 {
 		 struct aspeed=5Fgpio *gpio =3D to=5Faspeed=5Fgpio(gc);
+		 struct aspeed=5Fgpio=5Fbank *bank =3D to=5Fbank(offset);
 		 unsigned long flags;
 		 u32 reg;

 		 spin=5Flock=5Firqsave(&gpio->lock, flags);

-		 reg =3D ioread32(gpio->base + GPIO=5FDIR);
-		 iowrite32(reg & ~BIT(offset), gpio->base + GPIO=5FDIR);
+		 reg =3D ioread32(bank=5Fval=5Freg(gpio, bank, GPIO=5FDIR));
+		 iowrite32(reg & ~GPIO=5FBIT(offset), bank=5Fval=5Freg(gpio, bank,
GPIO=5FDIR));

 		 spin=5Funlock=5Firqrestore(&gpio->lock, flags);

@@ -78,19 +132,49 @@ static int aspeed=5Fgpio=5Fdir=5Fout(struct gpio=5Fchi=
p *gc,
 		 		 		        unsigned int offset, int val)
 {
 		 struct aspeed=5Fgpio *gpio =3D to=5Faspeed=5Fgpio(gc);
+		 struct aspeed=5Fgpio=5Fbank *bank =3D to=5Fbank(offset);
 		 unsigned long flags;
 		 u32 reg;

 		 spin=5Flock=5Firqsave(&gpio->lock, flags);

-		 reg =3D ioread32(gpio->base + GPIO=5FDIR);
-		 iowrite32(reg | BIT(offset), gpio->base + GPIO=5FDIR);
+		 reg =3D ioread32(bank=5Fval=5Freg(gpio, bank, GPIO=5FDIR));
+		 iowrite32(reg | GPIO=5FBIT(offset), bank=5Fval=5Freg(gpio, bank,
GPIO=5FDIR));

 		 spin=5Funlock=5Firqrestore(&gpio->lock, flags);

 		 return 0;
 }

+static void aspeed=5Fgpio=5Fset=5Fnames(struct aspeed=5Fgpio *gpio)
+{
+		 const char format[] =3D "GPIOXn";
+		 char *namebuf, **names;
+		 unsigned int i;
+
+		 /* our buffer of name pointers */
+		 names =3D devm=5Fkmalloc=5Farray(gpio->chip.dev, gpio->chip.ngpio,
+		 		 		 sizeof(char *), GFP=5FKERNEL);
+
+		 /* and one contiguous buffer for the names themselves */
+		 namebuf =3D devm=5Fkmalloc=5Farray(gpio->chip.dev, gpio->chip.ngpio,
+		 		 		 sizeof(format), GFP=5FKERNEL);
+
+		 for (i =3D 0; i < gpio->chip.ngpio; i++) {
+		 		 struct aspeed=5Fgpio=5Fbank *bank =3D to=5Fbank(i);
+		 		 char *name =3D namebuf + (i * sizeof(format));
+		 		 int bit =3D GPIO=5FOFFSET(i);
+
+		 		 memcpy(name, format, 4);
+		 		 name[4] =3D bank->names[bit >> 3];
+		 		 name[5] =3D '0' + (bit % 8);
+		 		 name[6] =3D '\0';
+		 		 names[i] =3D name;
+		 }
+
+		 gpio->chip.names =3D (const char * const *)names;
+}
+
 static int =5F=5Finit aspeed=5Fgpio=5Fprobe(struct platform=5Fdevice *pdev)
 {
 		 struct resource *res;
@@ -110,7 +194,7 @@ static int =5F=5Finit aspeed=5Fgpio=5Fprobe(struct
platform=5Fdevice *pdev)

 		 spin=5Flock=5Finit(&gpio->lock);

-		 gpio->chip.ngpio =3D 32;
+		 gpio->chip.ngpio =3D ARRAY=5FSIZE(aspeed=5Fgpio=5Fbanks) * 32;

 		 gpio->chip.dev =3D &pdev->dev;
 		 gpio->chip.direction=5Finput =3D aspeed=5Fgpio=5Fdir=5Fin;
@@ -120,6 +204,8 @@ static int =5F=5Finit aspeed=5Fgpio=5Fprobe(struct
platform=5Fdevice *pdev)
 		 gpio->chip.label =3D dev=5Fname(&pdev->dev);
 		 gpio->chip.base =3D -1;

+		 aspeed=5Fgpio=5Fset=5Fnames(gpio);
+
 		 platform=5Fset=5Fdrvdata(pdev, gpio);

 		 return gpiochip=5Fadd(&gpio->chip);
--
2.6.0


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF478DFDA643B8f9e8a93df938690918c09BBF478DFDA643B
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Will the old gpio #'s still work with this?   Can I export b=
y gpio pin name?  echo &quot;A3&quot; &gt; /sys/class/gpio/export?<br><br><=
br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09BBF478DFDA643B8f9=
e8a93df938690918c09B@" border=3D"0" alt=3D"Inactive hide details for OpenBM=
C Patches ---10/27/2015 08:14:50 AM---From: Jeremy Kerr &lt;jk@ozlabs.org&g=
t; Signed-off-by: Jeremy K"><font color=3D"#424282">OpenBMC Patches ---10/2=
7/2015 08:14:50 AM---From: Jeremy Kerr &lt;jk@ozlabs.org&gt; Signed-off-by:=
 Jeremy Kerr &lt;jk@ozlabs.org&gt;</font><br><br><font size=3D"2" color=3D"=
#5F5F5F">From:        </font><font size=3D"2">OpenBMC Patches &lt;patches@s=
twcx.xyz&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font=
><font size=3D"2">openbmc@lists.ozlabs.org</font><br><font size=3D"2" color=
=3D"#5F5F5F">Date:        </font><font size=3D"2">10/27/2015 08:14 AM</font=
><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=
=3D"2">[PATCH linux 2/3] gpio/aspeed: Expose entire bank as one gpio chip</=
font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font si=
ze=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=3Dus.ibm.com@lists.=
ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" nosha=
de style=3D"color:#8091A5; "><br><br><br><tt>From: Jeremy Kerr &lt;jk@ozlab=
s.org&gt;<br><br>Signed-off-by: Jeremy Kerr &lt;jk@ozlabs.org&gt;<br>---<br=
> arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | &nbsp;29 +------<br> driv=
ers/gpio/gpio-aspeed.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| 106 +++++++++++++++++++++++---<br> 2 files changed, 98 i=
nsertions(+), 37 deletions(-)<br><br>diff --git a/arch/arm/boot/dts/aspeed-=
bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts<br>ind=
ex d90e4ba..e63ddb9 100644<br>--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmet=
to.dts<br>+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts<br>@@ -145,34=
 +145,9 @@<br>                                                             =
        clocks =3D &lt;&amp;clk=5Fapb&gt;;<br>                             =
                       };<br> <br>-                                        =
           gpio0: gpio@1e780000 {<br>+                                     =
              gpio: gpio@1e780000 {<br>                                    =
                &nbsp; &nbsp; &nbsp; &nbsp;compatible =3D &quot;aspeed,ast2=
400-gpio&quot;;<br>-                                                   &nbs=
p; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x1e780000 0x20&gt;;<br>-               =
                                    };<br>-<br>-                           =
                        gpio1: gpio@1e780020 {<br>-                        =
                           &nbsp; &nbsp; &nbsp; &nbsp;compatible =3D &quot;=
aspeed,ast2400-gpio&quot;;<br>-                                            =
       &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x1e780020 0x20&gt;;<br>-    =
                                               };<br>-<br>-                =
                                   gpio2: gpio@1e780070 {<br>-             =
                                      &nbsp; &nbsp; &nbsp; &nbsp;compatible=
 =3D &quot;aspeed,ast2400-gpio&quot;;<br>-                                 =
                  &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x1e780070 0x8&gt;=
;<br>-                                                   };<br>-<br>-      =
                                             gpio3: gpio@1e780078 {<br>-   =
                                                &nbsp; &nbsp; &nbsp; &nbsp;=
compatible =3D &quot;aspeed,ast2400-gpio&quot;;<br>-                       =
                            &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x1e7800=
78 0x8&gt;;<br>-                                                   };<br>-<=
br>-                                                   gpio4: gpio@1e780080=
 {<br>-                                                   &nbsp; &nbsp; &nb=
sp; &nbsp;compatible =3D &quot;aspeed,ast2400-gpio&quot;;<br>-             =
                                      &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &l=
t;0x1e780080 0x8&gt;;<br>-                                                 =
  };<br>-<br>-                                                   gpio5: gpi=
o@1e780088 {<br>-                                                   &nbsp; =
&nbsp; &nbsp; &nbsp;compatible =3D &quot;aspeed,ast2400-gpio&quot;;<br>-   =
                                                &nbsp; &nbsp; &nbsp; &nbsp;=
reg =3D &lt;0x1e780088 0x8&gt;;<br>+                                       =
            &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x1e780000 0x1000&gt;;<b=
r>                                                    };<br> <br>          =
                                          uart1: serial@1e783000 {<br>diff =
--git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c<br>index f3=
47260..8295371 100644<br>--- a/drivers/gpio/gpio-aspeed.c<br>+++ b/drivers/=
gpio/gpio-aspeed.c<br>@@ -23,6 +23,42 @@ struct aspeed=5Fgpio {<br>        =
          void =5F=5Fiomem *base;<br> };<br> <br>+struct aspeed=5Fgpio=5Fba=
nk {<br>+                 uint16=5Ft                 val=5Fregs;<br>+      =
           char                                  names[4];<br>+};<br>+<br>+=
static struct aspeed=5Fgpio=5Fbank aspeed=5Fgpio=5Fbanks[] =3D {<br>+      =
           {<br>+                                  .val=5Fregs =3D 0x0000,<=
br>+                                  .names =3D { 'A', 'B', 'C', 'D' },<br=
>+                 },<br>+                 {<br>+                          =
        .val=5Fregs =3D 0x0020,<br>+                                  .name=
s =3D { 'E', 'F', 'G', 'H' },<br>+                 },<br>+                 =
{<br>+                                  .val=5Fregs =3D 0x0070,<br>+       =
                           .names =3D { 'I', 'J', 'K', 'L' },<br>+         =
        },<br>+                 {<br>+                                  .va=
l=5Fregs =3D 0x0078,<br>+                                  .names =3D { 'M'=
, 'N', 'O', 'P' },<br>+                 },<br>+                 {<br>+     =
                             .val=5Fregs =3D 0x0080,<br>+                  =
                .names =3D { 'Q', 'R', 'S', 'T' },<br>+                 },<=
br>+                 {<br>+                                  .val=5Fregs =
=3D 0x0088,<br>+                                  .names =3D { 'U', 'V', 'W=
', 'X' },<br>+                 },<br>+};<br>+<br>+#define GPIO=5FBANK(x)   =
              ((x) &gt;&gt; 5)<br>+#define GPIO=5FOFFSET(x)                =
 ((x) &amp; 0x1f)<br>+#define GPIO=5FBIT(x)                 BIT(GPIO=5FOFFS=
ET(x))<br>+<br> #define GPIO=5FDATA                 0x00<br> #define GPIO=
=5FDIR                 0x04<br> <br>@@ -31,29 +67,46 @@ static inline struc=
t aspeed=5Fgpio *to=5Faspeed=5Fgpio(struct gpio=5Fchip *chip)<br>          =
        return container=5Fof(chip, struct aspeed=5Fgpio, chip);<br> }<br> =
<br>+static struct aspeed=5Fgpio=5Fbank *to=5Fbank(unsigned int offset)<br>=
+{<br>+                 unsigned int bank =3D GPIO=5FBANK(offset);<br>+    =
             WARN=5FON(bank &gt; ARRAY=5FSIZE(aspeed=5Fgpio=5Fbanks));<br>+=
                 return &amp;aspeed=5Fgpio=5Fbanks[bank];<br>+}<br>+<br>+st=
atic void *bank=5Fval=5Freg(struct aspeed=5Fgpio *gpio,<br>+               =
                   struct aspeed=5Fgpio=5Fbank *bank,<br>+                 =
                 unsigned int reg)<br>+{<br>+                 return gpio-&=
gt;base + bank-&gt;val=5Fregs + reg;<br>+}<br>+<br> static int aspeed=5Fgpi=
o=5Fget(struct gpio=5Fchip *gc, unsigned int offset)<br> {<br>             =
     struct aspeed=5Fgpio *gpio =3D to=5Faspeed=5Fgpio(gc);<br>+           =
      struct aspeed=5Fgpio=5Fbank *bank =3D to=5Fbank(offset);<br> <br>-   =
              return !!(ioread32(gpio-&gt;base + GPIO=5FDATA) &amp; BIT(off=
set));<br>+                 return !!(ioread32(bank=5Fval=5Freg(gpio, bank,=
 GPIO=5FDATA))<br>+                                                   &amp;=
 GPIO=5FBIT(offset));<br> }<br> <br> static void aspeed=5Fgpio=5Fset(struct=
 gpio=5Fchip *gc, unsigned int offset,<br>                                 =
                   &nbsp; &nbsp; int val)<br> {<br>                  struct=
 aspeed=5Fgpio *gpio =3D to=5Faspeed=5Fgpio(gc);<br>+                 struc=
t aspeed=5Fgpio=5Fbank *bank =3D to=5Fbank(offset);<br>                  un=
signed long flags;<br>                  u32 reg;<br> <br>                  =
spin=5Flock=5Firqsave(&amp;gpio-&gt;lock, flags);<br> <br>-                =
 reg =3D ioread32(gpio-&gt;base + GPIO=5FDATA);<br>+                 reg =
=3D ioread32(bank=5Fval=5Freg(gpio, bank, GPIO=5FDATA));<br>               =
   if (val)<br>-                                  reg |=3D BIT(offset);<br>=
+                                  reg |=3D GPIO=5FBIT(offset);<br>        =
          else<br>-                                  reg &amp;=3D ~BIT(offs=
et);<br>+                                  reg &amp;=3D ~GPIO=5FBIT(offset)=
;<br> <br>-                 iowrite32(reg, gpio-&gt;base + GPIO=5FDATA);<br=
>+                 iowrite32(reg, bank=5Fval=5Freg(gpio, bank, GPIO=5FDATA)=
);<br> <br>                  spin=5Funlock=5Firqrestore(&amp;gpio-&gt;lock,=
 flags);<br> }<br>@@ -61,13 +114,14 @@ static void aspeed=5Fgpio=5Fset(stru=
ct gpio=5Fchip *gc, unsigned int offset,<br> static int aspeed=5Fgpio=5Fdir=
=5Fin(struct gpio=5Fchip *gc, unsigned int offset)<br> {<br>               =
   struct aspeed=5Fgpio *gpio =3D to=5Faspeed=5Fgpio(gc);<br>+             =
    struct aspeed=5Fgpio=5Fbank *bank =3D to=5Fbank(offset);<br>           =
       unsigned long flags;<br>                  u32 reg;<br> <br>         =
         spin=5Flock=5Firqsave(&amp;gpio-&gt;lock, flags);<br> <br>-       =
          reg =3D ioread32(gpio-&gt;base + GPIO=5FDIR);<br>-               =
  iowrite32(reg &amp; ~BIT(offset), gpio-&gt;base + GPIO=5FDIR);<br>+      =
           reg =3D ioread32(bank=5Fval=5Freg(gpio, bank, GPIO=5FDIR));<br>+=
                 iowrite32(reg &amp; ~GPIO=5FBIT(offset), bank=5Fval=5Freg(=
gpio, bank, GPIO=5FDIR));<br> <br>                  spin=5Funlock=5Firqrest=
ore(&amp;gpio-&gt;lock, flags);<br> <br>@@ -78,19 +132,49 @@ static int asp=
eed=5Fgpio=5Fdir=5Fout(struct gpio=5Fchip *gc,<br>                         =
                           &nbsp; &nbsp; &nbsp; &nbsp;unsigned int offset, =
int val)<br> {<br>                  struct aspeed=5Fgpio *gpio =3D to=5Fasp=
eed=5Fgpio(gc);<br>+                 struct aspeed=5Fgpio=5Fbank *bank =3D =
to=5Fbank(offset);<br>                  unsigned long flags;<br>           =
       u32 reg;<br> <br>                  spin=5Flock=5Firqsave(&amp;gpio-&=
gt;lock, flags);<br> <br>-                 reg =3D ioread32(gpio-&gt;base +=
 GPIO=5FDIR);<br>-                 iowrite32(reg | BIT(offset), gpio-&gt;ba=
se + GPIO=5FDIR);<br>+                 reg =3D ioread32(bank=5Fval=5Freg(gp=
io, bank, GPIO=5FDIR));<br>+                 iowrite32(reg | GPIO=5FBIT(off=
set), bank=5Fval=5Freg(gpio, bank, GPIO=5FDIR));<br> <br>                  =
spin=5Funlock=5Firqrestore(&amp;gpio-&gt;lock, flags);<br> <br>            =
      return 0;<br> }<br> <br>+static void aspeed=5Fgpio=5Fset=5Fnames(stru=
ct aspeed=5Fgpio *gpio)<br>+{<br>+                 const char format[] =3D =
&quot;GPIOXn&quot;;<br>+                 char *namebuf, **names;<br>+      =
           unsigned int i;<br>+<br>+                 /* our buffer of name =
pointers */<br>+                 names =3D devm=5Fkmalloc=5Farray(gpio-&gt;=
chip.dev, gpio-&gt;chip.ngpio,<br>+                                        =
           sizeof(char *), GFP=5FKERNEL);<br>+<br>+                 /* and =
one contiguous buffer for the names themselves */<br>+                 name=
buf =3D devm=5Fkmalloc=5Farray(gpio-&gt;chip.dev, gpio-&gt;chip.ngpio,<br>+=
                                                   sizeof(format), GFP=5FKE=
RNEL);<br>+<br>+                 for (i =3D 0; i &lt; gpio-&gt;chip.ngpio; =
i++) {<br>+                                  struct aspeed=5Fgpio=5Fbank *b=
ank =3D to=5Fbank(i);<br>+                                  char *name =3D =
namebuf + (i * sizeof(format));<br>+                                  int b=
it =3D GPIO=5FOFFSET(i);<br>+<br>+                                  memcpy(=
name, format, 4);<br>+                                  name[4] =3D bank-&g=
t;names[bit &gt;&gt; 3];<br>+                                  name[5] =3D =
'0' + (bit % 8);<br>+                                  name[6] =3D '\0';<br=
>+                                  names[i] =3D name;<br>+                =
 }<br>+<br>+                 gpio-&gt;chip.names =3D (const char * const *)=
names;<br>+}<br>+<br> static int =5F=5Finit aspeed=5Fgpio=5Fprobe(struct pl=
atform=5Fdevice *pdev)<br> {<br>                  struct resource *res;<br>=
@@ -110,7 +194,7 @@ static int =5F=5Finit aspeed=5Fgpio=5Fprobe(struct plat=
form=5Fdevice *pdev)<br> <br>                  spin=5Flock=5Finit(&amp;gpio=
-&gt;lock);<br> <br>-                 gpio-&gt;chip.ngpio =3D 32;<br>+     =
            gpio-&gt;chip.ngpio =3D ARRAY=5FSIZE(aspeed=5Fgpio=5Fbanks) * 3=
2;<br> <br>                  gpio-&gt;chip.dev =3D &amp;pdev-&gt;dev;<br>  =
                gpio-&gt;chip.direction=5Finput =3D aspeed=5Fgpio=5Fdir=5Fi=
n;<br>@@ -120,6 +204,8 @@ static int =5F=5Finit aspeed=5Fgpio=5Fprobe(struc=
t platform=5Fdevice *pdev)<br>                  gpio-&gt;chip.label =3D dev=
=5Fname(&amp;pdev-&gt;dev);<br>                  gpio-&gt;chip.base =3D -1;=
<br> <br>+                 aspeed=5Fgpio=5Fset=5Fnames(gpio);<br>+<br>     =
             platform=5Fset=5Fdrvdata(pdev, gpio);<br> <br>                =
  return gpiochip=5Fadd(&amp;gpio-&gt;chip);<br>-- <br>2.6.0<br><br><br>=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc =
mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lis=
ts.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</=
a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF478DFDA643B8f9e8a93df938690918c09BBF478DFDA643B--


--0__=09BBF478DFDA643B8f9e8a93df938690918c09BBF478DFDA643B
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF478DFDA643B8f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF478DFDA643B8f9e8a93df938690918c09BBF478DFDA643B--
