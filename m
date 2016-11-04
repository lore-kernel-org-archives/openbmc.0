Return-Path: <maxims@google.com>
Received: from mail-yw0-x234.google.com (mail-yw0-x234.google.com
 [IPv6:2607:f8b0:4002:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9dsh2tjzzDvc0
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 10:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GnkXYYmL"; 
 dkim-atps=neutral
Received: by mail-yw0-x234.google.com with SMTP id l124so102827700ywb.3
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 16:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mhT74vO0kh/AtcLQYCvQ2yhOqvQH+SkCRyBRUOHn76c=;
 b=GnkXYYmLRR5LD+fXVmugLFVkaHdI9irYrmXZ9AmIrKhMF0IVejeV71dLVD2NBDlalu
 kulmC+I3sm97dM0wY0nPXxR+JzadF3LubFH7zIIbq775WBw1sESBXZoVsuf9IqXa2Y0j
 zoVgi4g7dCBvQszpwXtJF4OCuboSpUzz9qEm6hdK3TOddawCh8d2Tjv89s6gRT9PIqHK
 vfi/cgd+qr4nutaIVmR2vT9W0rLwS2H2AvTMDdq40pP1Yzg57C1iAGgG/SBVptq9TLEv
 8cECEFgXaOr5kTAbHb+RxWfykm05dpRMNp+vCWPALYLkS2R1bIJfUwL/ayuwWAx+xTV3
 ureg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mhT74vO0kh/AtcLQYCvQ2yhOqvQH+SkCRyBRUOHn76c=;
 b=I03sHt8ofgcf6iMOpRi7dmE7LzFm/vCRyYFIProoJ+kXIVN/7GDActVe7Imu6FMXut
 jmt8gcYRVFHBjK/annEGT4uN5f/aa8vomdvpKewxFbdR8c5+66Corv7fyr2sRy0t8bkg
 8pvPY1eQ7Xo6mckMXHkPB6cUUYmBmNYX0nr/h4gW4LvnbuXJMcacPMJhQKHzRT559cch
 HxMEEcPJX4bvjaCf4Pv6R71YJawvBXr4iIhdiFramNIHx5itZ+7WIPuSiBBqy3zEid2o
 Bvu903NVJAk2aY6nidkegVFcB8SepRuaNs9/BH1I7DepsMUqeiqsRcnadmFJup5Mqy5q
 RiUw==
X-Gm-Message-State: ABUngvdA4Igf3KxxyKRZQuBPl2C5KCzjdnE5vaPqjihnAErnc6USpudPuC6uvEdIJzv6pvXGE08fcXUKJqEsv1x0
X-Received: by 10.13.212.129 with SMTP id w123mr6475681ywd.180.1478303508957; 
 Fri, 04 Nov 2016 16:51:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.56.210 with HTTP; Fri, 4 Nov 2016 16:51:48 -0700 (PDT)
In-Reply-To: <CAFR_W8oez8r9qX1A8KD-egFbcBZrWLmNc0hwagmM+XyjKvmiWQ@mail.gmail.com>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
 <7a5ddb25-a5d6-104b-b81e-3d92d43b26e6@kaod.org>
 <CAFR_W8oez8r9qX1A8KD-egFbcBZrWLmNc0hwagmM+XyjKvmiWQ@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 4 Nov 2016 16:51:48 -0700
Message-ID: <CAFR_W8q+A+V3RyUGO-cNqqYLnzOA_jJaj-eMiYFbtJcN5uN=Dg@mail.gmail.com>
Subject: Re: U-Boot upstreaming
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/mixed; boundary=001a114fa73886293a0540825b75
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2016 23:51:53 -0000

--001a114fa73886293a0540825b75
Content-Type: multipart/alternative; boundary=001a114fa7388629350540825b73

--001a114fa7388629350540825b73
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 4, 2016 at 10:46 AM, Maxim Sloyko <maxims@google.com> wrote:

>
>
> On Fri, Nov 4, 2016 at 8:54 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>
>> Hello !
>>
>> On 11/03/2016 09:44 PM, Maxim Sloyko wrote:
>> > Hi Cedric,
>> >
>> > My manager (Rick Alther) mentioned that you were working on some
>> > minimal "upstreamable" commit for Aspeed in U-Boot. How far were
>> > you able to get?
>>
>> Please check :
>>
>>   https://github.com/openbmc/u-boot/wiki
>>
>> This is where we track the ugly details and here is my tree :
>>
>>    https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc
>>
>> Patch one is the "minimum" we have been working on with Joel these
>> last 6 months to :
>>
>>  * make it compatible with upstream
>>  * extract all exoticisms
>>  * extract funky drivers
>>  * isolate ugly hacks
>>
>> I think we are at a point where we need to rewrite bits of lowlevel_init
>> or move them later on in the code. This big asm routines does :
>>
>>  * LPC patching for ast2300 (we can kill that)
>>  * uart init (if SDRAM calibration is done, easy we can keep)
>>  * SDRAM calibration (we could use static calibration values instead)
>>  * SDRAM size calculation (may be we can move that in a C part)
>>  * video clock setting (one reg setting)
>>  * JTAG master (one reg setting)
>>  * RMII/RGMII clock setting (one reg setting)
>>  * GPIO massive reset (not sure if this is useful, should ask Andrew)
>>  * SPI Calibration (I have done in C so we can move)
>>
>
> Yes, I looked at it too and it does not look like any of that has any
> business being in lowlevel_init, let alone being implemented in asm.
>
> Did you try moving this whole function further down the init sequence?
> board_early_init_f might be a good candidate. It might cause problems
> because it does not restore registers properly, but should be an easy fix=
 --
> at this point we would already have stack setup for us (need to be
> configured via CONFIG_SYS_INIT_SP_ADDR to point to the top of SRAM) and
> even have a basic malloc (need to be configured). This would make calling
> into C somewhat easier.
>

OK, so I actually tried this and it works! I did it on my branch so that I
can just quickly give it a try and don't really have time to prepare proper
patch today (this being Friday and all), but this is the summary of
required changes: (the patch is also attached, just in case, but you won't
be able to apply it)

--- a/arch/arm/mach-aspeed/platform_g5.S
+++ b/arch/arm/mach-aspeed/platform_g5.S
@@ -242,12 +242,12 @@ TIME_TABLE_DDR4_1600:
  Calibration Macro End

***************************************************************************=
***/

-.globl lowlevel_init
-lowlevel_init:
+.globl board_early_init_f
+board_early_init_f:

// Here I'm just renaming lowlevel_init to board_early_init_f

 init_dram:
     /* save lr */
-    mov   r4, lr
+ push {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}

We are inside board_init_f, so we have stack at this point. Let's use it.

     /* Clear AHB bus lock condition */
     ldr   r0, =3D0x1e600000
@@ -1991,9 +1991,6 @@ set_D2PLL:
     ldr   r1, =3D0xEA
     str   r1, [r0]

-    /* restore lr */
-    mov   lr, r4
-
-    /* back to arch calling code */
-    mov   pc, lr
+ mov r0, #0
+ pop {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}

// basically, return 0

diff --git a/board/aspeed/zaius-bmc/zaius-bmc.c
b/board/aspeed/zaius-bmc/zaius-bmc.c
index 04909d1..0052767 100644
--- a/board/aspeed/zaius-bmc/zaius-bmc.c
+++ b/board/aspeed/zaius-bmc/zaius-bmc.c
@@ -56,6 +56,8 @@ void show_boot_progress(int progress)
 }
 #endif

+void lowlevel_init() {}
+

// The function is not necessary, but it is still called, so needs to be
present in the binary.

 int board_init(void)
 {
  /* adress of boot parameters */
diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index 0c7d8fe..b9c87d6 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -33,10 +33,10 @@
 #define CONFIG_SYS_DCACHE_OFF 1

// Config changes -- this is the most important part. U-Boot will use these
to setup stack and heap for us.

 #define CONFIG_SYS_SDRAM_BASE AST_DRAM_BASE
-#define CONFIG_SYS_INIT_RAM_ADDR CONFIG_SYS_SDRAM_BASE
-#define CONFIG_SYS_INIT_RAM_SIZE (32*1024)
+#define CONFIG_SYS_INIT_RAM_ADDR (AST_SRAM_BASE)
+#define CONFIG_SYS_INIT_RAM_SIZE (36*1024)
 #define CONFIG_SYS_INIT_RAM_END (CONFIG_SYS_INIT_RAM_ADDR +
CONFIG_SYS_INIT_RAM_SIZE)
-#define CONFIG_SYS_INIT_SP_ADDR (CONFIG_SYS_INIT_RAM_END -
GENERATED_GBL_DATA_SIZE)
+#define CONFIG_SYS_INIT_SP_ADDR (CONFIG_SYS_INIT_RAM_END)

 #define CONFIG_NR_DRAM_BANKS 1

diff --git a/include/configs/zaius-bmc.h b/include/configs/zaius-bmc.h
index cf4b1ff..65a76fb 100644
--- a/include/configs/zaius-bmc.h
+++ b/include/configs/zaius-bmc.h
@@ -36,6 +36,9 @@
 #define CONFIG_EEPROM_I2C_ADDR (0x50)
 #define CONFIG_ID_EEPROM

// Don't forget to enable the call to board_early_init_f, it's behind
#ifdef in board_f.c

+#define CONFIG_SYS_INIT_SP_OFFSET (CONFIG_SYS_GBL_DATA_OFFSET)
+#define CONFIG_BOARD_EARLY_INIT_F
+
 /* platform.S settings */
 #define CONFIG_DRAM_ECC
 #define CONFIG_DRAM_ECC_SIZE 0x20000000

Compile, flash and U-Boot booted to a prompt on the eval board.


>
>>
>> > This is also what I was thinking of doing, so we should be able to joi=
n
>> forces on this.
>> >
>> > I talked to Simon Glass recently (he's an active contributor to
>> mainline U-Boot)
>> > and basically that's the path that he also recommended -- just getting
>> minimal amount
>> > of code in, that can just boot to a prompt. He also said that DRAM
>> driver would have
>> > to be part of it.
>>
>> yes. See my comments above.
>>
>> > So, the way I see it, there are two big chunks of work here:
>> >  1. Setting up the whole structure. This would include actually adding
>> a board, minimum
>> > amount of supporting code, debug serial console init,
>>
>> yes. that is patch one above, in which we still need to cleanup
>> stuff in the .S part.
>>
>> >  2. DDR3/DDR4 driver. This is the biggest part of what we have in
>> platform.S now. A lot
>> > of work, but relatively straightforward, just rewrite ~1.5k lines of
>> assembly in C.
>>
>> I am not sure this is feasible, AFAIK, you can not call C. I might
>> be wrong.
>>
>
> You can. I tried it and it works. We just need stack (see above). Even if
> moving the whole lowlevel_init further down will prove too hard, we can a=
t
> least call
>
> mov sp, =3DTOP_OF_SRAM
>
> at top of lowlevel_init. after this you can write (and call into) pretty
> complicated C functions. This is what I've tried in my early experiments.
>
>
>>
>> > Personally, I don't have preference on who does what, as long as we
>> don't step on each
>> > other's toes. It would probably be easier for me to take (1), because =
I
>> can easily talk
>> > to two people who are in our time zone and have a lot of mainline
>> U-Boot experience.
>> >
>> > Thoughts?
>>
>> you could send patches on top of my tree to cleanup what ever
>> part you want in lowlevel_init. when lowlevel_init reaches a
>> minimum acceptable level, with a full patchset working on top
>> of it, I think we can send for review. Then, we will work on
>> the next details :
>>
>>  * extra settings
>>  * spi/nor driver
>>  * ftgmac100 extensions for Aspeed
>>  * NCSI support
>>  * DTS support
>>  * etc.
>>
>> There is also a massive hack on the ast2500 mmu disablement in
>> the core part of u-boot that I don't understand. So we could
>> try to fix now or ask help when the patchset is sent.
>>
>>
>> Cheers,
>>
>> C.
>>
>
>
>
> --
> *M*axim *S*loyko
>



--=20
*M*axim *S*loyko

--001a114fa7388629350540825b73
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Nov 4, 2016 at 10:46 AM, Maxim Sloyko <span dir=3D"ltr">&lt;<a =
href=3D"mailto:maxims@google.com" target=3D"_blank">maxims@google.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><=
div><div class=3D"gmail-h5">On Fri, Nov 4, 2016 at 8:54 AM, C=C3=A9dric Le =
Goater <span dir=3D"ltr">&lt;<a href=3D"mailto:clg@kaod.org" target=3D"_bla=
nk">clg@kaod.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello !<br>
<span><br>
On 11/03/2016 09:44 PM, Maxim Sloyko wrote:<br>
&gt; Hi Cedric,<br>
&gt;<br>
&gt; My manager (Rick Alther) mentioned that you were working on some<br>
&gt; minimal &quot;upstreamable&quot; commit for Aspeed in U-Boot. How far =
were<br>
&gt; you able to get?<br>
<br>
</span>Please check :<br>
<br>
=C2=A0 <a href=3D"https://github.com/openbmc/u-boot/wiki" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openbmc/u-b<wbr>oot/wiki</a><br>
<br>
This is where we track the ugly details and here is my tree :<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/legoater/u-boot/commits/v2016.11=
-aspeed-openbmc" rel=3D"noreferrer" target=3D"_blank">https://github.com/le=
goater/<wbr>u-boot/commits/v2016.11-<wbr>aspeed-openbmc</a><br>
<br>
Patch one is the &quot;minimum&quot; we have been working on with Joel thes=
e<br>
last 6 months to :<br>
<br>
=C2=A0* make it compatible with upstream<br>
=C2=A0* extract all exoticisms<br>
=C2=A0* extract funky drivers<br>
=C2=A0* isolate ugly hacks<br>
<br>
I think we are at a point where we need to rewrite bits of lowlevel_init<br=
>
or move them later on in the code. This big asm routines does :<br>
<br>
=C2=A0* LPC patching for ast2300 (we can kill that)<br>
=C2=A0* uart init (if SDRAM calibration is done, easy we can keep)<br>
=C2=A0* SDRAM calibration (we could use static calibration values instead)<=
br>
=C2=A0* SDRAM size calculation (may be we can move that in a C part)<br>
=C2=A0* video clock setting (one reg setting)<br>
=C2=A0* JTAG master (one reg setting)<br>
=C2=A0* RMII/RGMII clock setting (one reg setting)<br>
=C2=A0* GPIO massive reset (not sure if this is useful, should ask Andrew)<=
br>
=C2=A0* SPI Calibration (I have done in C so we can move)<br></blockquote><=
div><br></div></div></div><div>Yes, I looked at it too and it does not look=
 like any of that has any business being in lowlevel_init, let alone being =
implemented in asm.</div><div><br></div><div>Did you try moving this whole =
function further down the init sequence? board_early_init_f might be a good=
 candidate. It might cause problems because it does not restore registers p=
roperly, but should be an easy fix --</div><div>at this point we would alre=
ady have stack setup for us (need to be configured via CONFIG_SYS_INIT_SP_A=
DDR to point to the top of SRAM) and even have a basic malloc (need to be c=
onfigured). This would make calling into C somewhat easier.=C2=A0</div></di=
v></div></div></blockquote><div><br></div><div>OK, so I actually tried this=
 and it works! I did it on my branch so that I can just quickly give it a t=
ry and don&#39;t really have time to prepare proper patch today (this being=
 Friday and all), but this is the summary of required changes: (the patch i=
s also attached, just in case, but you won&#39;t be able to apply it)</div>=
<div><br></div><div><div>--- a/arch/arm/mach-aspeed/platform_g5.S</div><div=
>+++ b/arch/arm/mach-aspeed/platform_g5.S</div><div>@@ -242,12 +242,12 @@ T=
IME_TABLE_DDR4_1600:</div><div>=C2=A0 Calibration Macro End</div><div>=C2=
=A0 ***********************************************************************=
*******/</div><div>=C2=A0</div><div>-.globl lowlevel_init</div><div>-lowlev=
el_init:</div><div>+.globl board_early_init_f</div><div>+board_early_init_f=
:<br></div><div><br></div><div>// Here I&#39;m just renaming lowlevel_init =
to board_early_init_f</div><div>=C2=A0</div><div>=C2=A0init_dram:</div><div=
>=C2=A0 =C2=A0 =C2=A0/* save lr */</div><div>- =C2=A0 =C2=A0mov =C2=A0 r4, =
lr</div><div>+<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre=
">	</span>push {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}</div><div=
><br></div><div>We are inside board_init_f, so we have stack at this point.=
 Let&#39;s use it.</div><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0/* Clear =
AHB bus lock condition */</div><div>=C2=A0 =C2=A0 =C2=A0ldr =C2=A0 r0, =3D0=
x1e600000</div><div>@@ -1991,9 +1991,6 @@ set_D2PLL:</div><div>=C2=A0 =C2=
=A0 =C2=A0ldr =C2=A0 r1, =3D0xEA</div><div>=C2=A0 =C2=A0 =C2=A0str =C2=A0 r=
1, [r0]</div><div>=C2=A0</div><div>- =C2=A0 =C2=A0/* restore lr */</div><di=
v>- =C2=A0 =C2=A0mov =C2=A0 lr, r4</div><div>-</div><div>- =C2=A0 =C2=A0/* =
back to arch calling code */</div><div>- =C2=A0 =C2=A0mov =C2=A0 pc, lr</di=
v><div>+<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</s=
pan>mov r0, #0</div><div>+<span class=3D"gmail-Apple-tab-span" style=3D"whi=
te-space:pre">	</span>pop {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, pc=
}</div><div><br></div><div>// basically, return 0</div><div>=C2=A0</div><di=
v>diff --git a/board/aspeed/zaius-bmc/zaius-bmc.c b/board/aspeed/zaius-bmc/=
zaius-bmc.c</div><div>index 04909d1..0052767 100644</div><div>--- a/board/a=
speed/zaius-bmc/zaius-bmc.c</div><div>+++ b/board/aspeed/zaius-bmc/zaius-bm=
c.c</div><div>@@ -56,6 +56,8 @@ void show_boot_progress(int progress)</div>=
<div>=C2=A0}</div><div>=C2=A0#endif</div><div>=C2=A0</div><div>+void lowlev=
el_init() {}</div><div>+</div><div><br></div><div>// The function is not ne=
cessary, but it is still called, so needs to be present in the binary.</div=
><div><br></div><div>=C2=A0int board_init(void)</div><div>=C2=A0{</div><div=
>=C2=A0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>/* adress of boot parameters */</div><div>diff --git a/include/configs/a=
st-common.h b/include/configs/ast-common.h</div><div>index 0c7d8fe..b9c87d6=
 100644</div><div>--- a/include/configs/ast-common.h</div><div>+++ b/includ=
e/configs/ast-common.h</div><div>@@ -33,10 +33,10 @@</div><div>=C2=A0#defin=
e CONFIG_SYS_DCACHE_OFF<span class=3D"gmail-Apple-tab-span" style=3D"white-=
space:pre">		</span>1</div><div><br></div><div>// Config changes -- this is=
 the most important part. U-Boot will use these to setup stack and heap for=
 us.</div><div>=C2=A0</div><div>=C2=A0#define CONFIG_SYS_SDRAM_BASE<span cl=
ass=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>AST_DRAM_BA=
SE</div><div>-#define CONFIG_SYS_INIT_RAM_ADDR<span class=3D"gmail-Apple-ta=
b-span" style=3D"white-space:pre">	</span>CONFIG_SYS_SDRAM_BASE</div><div>-=
#define CONFIG_SYS_INIT_RAM_SIZE<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>(32*1024)</div><div>+#define CONFIG_SYS_INIT_R=
AM_ADDR<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>(AST_SRAM_BASE)</div><div>+#define CONFIG_SYS_INIT_RAM_SIZE<span class=
=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>(36*1024)</div>=
<div>=C2=A0#define CONFIG_SYS_INIT_RAM_END<span class=3D"gmail-Apple-tab-sp=
an" style=3D"white-space:pre">		</span>(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_S=
YS_INIT_RAM_SIZE)</div><div>-#define CONFIG_SYS_INIT_SP_ADDR <span class=3D=
"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>(CONFIG_SYS_INIT_R=
AM_END - GENERATED_GBL_DATA_SIZE)</div><div>+#define CONFIG_SYS_INIT_SP_ADD=
R <span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>(C=
ONFIG_SYS_INIT_RAM_END)</div><div>=C2=A0</div><div>=C2=A0#define CONFIG_NR_=
DRAM_BANKS<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		=
</span>1</div><div>=C2=A0</div><div>diff --git a/include/configs/zaius-bmc.=
h b/include/configs/zaius-bmc.h</div><div>index cf4b1ff..65a76fb 100644</di=
v><div>--- a/include/configs/zaius-bmc.h</div><div>+++ b/include/configs/za=
ius-bmc.h</div><div>@@ -36,6 +36,9 @@</div><div>=C2=A0#define CONFIG_EEPROM=
_I2C_ADDR<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">			=
</span>(0x50)</div><div>=C2=A0#define CONFIG_ID_EEPROM</div><div><br></div>=
<div>// Don&#39;t forget to enable the call to board_early_init_f, it&#39;s=
 behind #ifdef in board_f.c</div><div>=C2=A0</div><div>+#define CONFIG_SYS_=
INIT_SP_OFFSET (CONFIG_SYS_GBL_DATA_OFFSET)</div><div>+#define CONFIG_BOARD=
_EARLY_INIT_F</div><div>+</div><div>=C2=A0/* platform.S settings */</div><d=
iv>=C2=A0#define CONFIG_DRAM_ECC</div><div>=C2=A0#define<span class=3D"gmai=
l-Apple-tab-span" style=3D"white-space:pre">	</span>CONFIG_DRAM_ECC_SIZE<sp=
an class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>0x2000=
0000</div></div><div><br></div><div>Compile, flash and U-Boot booted to a p=
rompt on the eval board.=C2=A0</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><span class=3D"gmail-"><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<span><br>
&gt; This is also what I was thinking of doing, so we should be able to joi=
n forces on this.<br>
&gt;<br>
&gt; I talked to Simon Glass recently (he&#39;s an active contributor to ma=
inline U-Boot)<br>
&gt; and basically that&#39;s the path that he also recommended -- just get=
ting minimal amount<br>
&gt; of code in, that can just boot to a prompt. He also said that DRAM dri=
ver would have<br>
&gt; to be part of it.<br>
<br>
</span>yes. See my comments above.<br>
<span><br>
&gt; So, the way I see it, there are two big chunks of work here:<br>
&gt;=C2=A0 1. Setting up the whole structure. This would include actually a=
dding a board, minimum<br>
&gt; amount of supporting code, debug serial console init,<br>
<br>
</span>yes. that is patch one above, in which we still need to cleanup<br>
stuff in the .S part.<br>
<span><br>
&gt;=C2=A0 2. DDR3/DDR4 driver. This is the biggest part of what we have in=
 platform.S now. A lot<br>
&gt; of work, but relatively straightforward, just rewrite ~1.5k lines of a=
ssembly in C.<br>
<br>
</span>I am not sure this is feasible, AFAIK, you can not call C. I might<b=
r>
be wrong.<br></blockquote><div><br></div></span><div>You can. I tried it an=
d it works. We just need stack (see above). Even if moving the whole lowlev=
el_init further down will prove too hard, we can at least call</div><div><b=
r></div><div>mov sp, =3DTOP_OF_SRAM</div><div><br></div><div>at top of lowl=
evel_init. after this you can write (and call into) pretty complicated C fu=
nctions. This is what I&#39;ve tried in my early experiments.</div><span cl=
ass=3D"gmail-"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<span><br>
&gt; Personally, I don&#39;t have preference on who does what, as long as w=
e don&#39;t step on each<br>
&gt; other&#39;s toes. It would probably be easier for me to take (1), beca=
use I can easily talk<br>
&gt; to two people who are in our time zone and have a lot of mainline U-Bo=
ot experience.<br>
&gt;<br>
&gt; Thoughts?<br>
<br>
</span>you could send patches on top of my tree to cleanup what ever<br>
part you want in lowlevel_init. when lowlevel_init reaches a<br>
minimum acceptable level, with a full patchset working on top<br>
of it, I think we can send for review. Then, we will work on<br>
the next details :<br>
<br>
=C2=A0* extra settings<br>
=C2=A0* spi/nor driver<br>
=C2=A0* ftgmac100 extensions for Aspeed<br>
=C2=A0* NCSI support<br>
=C2=A0* DTS support<br>
=C2=A0* etc.<br>
<br>
There is also a massive hack on the ast2500 mmu disablement in<br>
the core part of u-boot that I don&#39;t understand. So we could<br>
try to fix now or ask help when the patchset is sent.<br>
<br>
<br>
Cheers,<br>
<br>
C.<br>
</blockquote></span></div><span class=3D"gmail-HOEnZb"><font color=3D"#8888=
88"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail-m_20768=
16628761673642gmail_signature"><div><b>M</b>axim <b>S</b>loyko</div></div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature"><div><b>M</b>axim <b>S</b>loyko</div></div>
</div></div>

--001a114fa7388629350540825b73--

--001a114fa73886293a0540825b75
Content-Type: text/x-patch; charset=US-ASCII; name="board_early_init_f.patch"
Content-Disposition: attachment; filename="board_early_init_f.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iv4fg0ic0

Y29tbWl0IDVlMDhiNmZjOGI3MmY4MjQwMzczZTE1ZjgyODI3OWRiMjdjYjA2ZmYKQXV0aG9yOiBN
YXhpbSBTbG95a28gPG1heGltc0Bnb29nbGUuY29tPgpEYXRlOiAgIEZyaSBOb3YgNCAxNjoyMzoy
OCAyMDE2IC0wNzAwCgogICAgSG93IHRvIG1vdmUgbG93bGV2ZWxfaW5pdCB0byBib2FyZF9lYXJs
eV9pbml0X2YKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWFzcGVlZC9wbGF0Zm9ybV9nNS5T
IGIvYXJjaC9hcm0vbWFjaC1hc3BlZWQvcGxhdGZvcm1fZzUuUwppbmRleCBjODEwZjQ0Li42Zjcy
ZjFjIDEwMDY0NAotLS0gYS9hcmNoL2FybS9tYWNoLWFzcGVlZC9wbGF0Zm9ybV9nNS5TCisrKyBi
L2FyY2gvYXJtL21hY2gtYXNwZWVkL3BsYXRmb3JtX2c1LlMKQEAgLTI0MiwxMiArMjQyLDEyIEBA
IFRJTUVfVEFCTEVfRERSNF8xNjAwOgogIENhbGlicmF0aW9uIE1hY3JvIEVuZAogICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKi8KIAotLmdsb2JsIGxvd2xldmVsX2luaXQKLWxvd2xldmVsX2luaXQ6Cisu
Z2xvYmwgYm9hcmRfZWFybHlfaW5pdF9mCitib2FyZF9lYXJseV9pbml0X2Y6CiAKIGluaXRfZHJh
bToKICAgICAvKiBzYXZlIGxyICovCi0gICAgbW92ICAgcjQsIGxyCisJcHVzaCB7cjEsIHIyLCBy
MywgcjQsIHI1LCByNiwgcjcsIHI4LCByOSwgcjEwLCByMTEsIGxyfQogCiAgICAgLyogQ2xlYXIg
QUhCIGJ1cyBsb2NrIGNvbmRpdGlvbiAqLwogICAgIGxkciAgIHIwLCA9MHgxZTYwMDAwMApAQCAt
MTk5MSw5ICsxOTkxLDYgQEAgc2V0X0QyUExMOgogICAgIGxkciAgIHIxLCA9MHhFQQogICAgIHN0
ciAgIHIxLCBbcjBdCiAKLSAgICAvKiByZXN0b3JlIGxyICovCi0gICAgbW92ICAgbHIsIHI0Ci0K
LSAgICAvKiBiYWNrIHRvIGFyY2ggY2FsbGluZyBjb2RlICovCi0gICAgbW92ICAgcGMsIGxyCisJ
bW92IHIwLCAjMAorCXBvcCB7cjEsIHIyLCByMywgcjQsIHI1LCByNiwgcjcsIHI4LCByOSwgcjEw
LCByMTEsIHBjfQogCmRpZmYgLS1naXQgYS9ib2FyZC9hc3BlZWQvemFpdXMtYm1jL3phaXVzLWJt
Yy5jIGIvYm9hcmQvYXNwZWVkL3phaXVzLWJtYy96YWl1cy1ibWMuYwppbmRleCAwNDkwOWQxLi4w
MDUyNzY3IDEwMDY0NAotLS0gYS9ib2FyZC9hc3BlZWQvemFpdXMtYm1jL3phaXVzLWJtYy5jCisr
KyBiL2JvYXJkL2FzcGVlZC96YWl1cy1ibWMvemFpdXMtYm1jLmMKQEAgLTU2LDYgKzU2LDggQEAg
dm9pZCBzaG93X2Jvb3RfcHJvZ3Jlc3MoaW50IHByb2dyZXNzKQogfQogI2VuZGlmCiAKK3ZvaWQg
bG93bGV2ZWxfaW5pdCgpIHt9CisKIGludCBib2FyZF9pbml0KHZvaWQpCiB7CiAJLyogYWRyZXNz
IG9mIGJvb3QgcGFyYW1ldGVycyAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9jb25maWdzL2FzdC1j
b21tb24uaCBiL2luY2x1ZGUvY29uZmlncy9hc3QtY29tbW9uLmgKaW5kZXggMGM3ZDhmZS4uYjlj
ODdkNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9jb25maWdzL2FzdC1jb21tb24uaAorKysgYi9pbmNs
dWRlL2NvbmZpZ3MvYXN0LWNvbW1vbi5oCkBAIC0zMywxMCArMzMsMTAgQEAKICNkZWZpbmUgQ09O
RklHX1NZU19EQ0FDSEVfT0ZGCQkxCiAKICNkZWZpbmUgQ09ORklHX1NZU19TRFJBTV9CQVNFCQlB
U1RfRFJBTV9CQVNFCi0jZGVmaW5lIENPTkZJR19TWVNfSU5JVF9SQU1fQUREUglDT05GSUdfU1lT
X1NEUkFNX0JBU0UKLSNkZWZpbmUgQ09ORklHX1NZU19JTklUX1JBTV9TSVpFCSgzMioxMDI0KQor
I2RlZmluZSBDT05GSUdfU1lTX0lOSVRfUkFNX0FERFIJKEFTVF9TUkFNX0JBU0UpCisjZGVmaW5l
IENPTkZJR19TWVNfSU5JVF9SQU1fU0laRQkoMzYqMTAyNCkKICNkZWZpbmUgQ09ORklHX1NZU19J
TklUX1JBTV9FTkQJCShDT05GSUdfU1lTX0lOSVRfUkFNX0FERFIgKyBDT05GSUdfU1lTX0lOSVRf
UkFNX1NJWkUpCi0jZGVmaW5lIENPTkZJR19TWVNfSU5JVF9TUF9BRERSIAkoQ09ORklHX1NZU19J
TklUX1JBTV9FTkQgLSBHRU5FUkFURURfR0JMX0RBVEFfU0laRSkKKyNkZWZpbmUgQ09ORklHX1NZ
U19JTklUX1NQX0FERFIgCShDT05GSUdfU1lTX0lOSVRfUkFNX0VORCkKIAogI2RlZmluZSBDT05G
SUdfTlJfRFJBTV9CQU5LUwkJMQogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2NvbmZpZ3MvemFpdXMt
Ym1jLmggYi9pbmNsdWRlL2NvbmZpZ3MvemFpdXMtYm1jLmgKaW5kZXggY2Y0YjFmZi4uNjVhNzZm
YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9jb25maWdzL3phaXVzLWJtYy5oCisrKyBiL2luY2x1ZGUv
Y29uZmlncy96YWl1cy1ibWMuaApAQCAtMzYsNiArMzYsOSBAQAogI2RlZmluZSBDT05GSUdfRUVQ
Uk9NX0kyQ19BRERSCQkJKDB4NTApCiAjZGVmaW5lIENPTkZJR19JRF9FRVBST00KIAorI2RlZmlu
ZSBDT05GSUdfU1lTX0lOSVRfU1BfT0ZGU0VUIChDT05GSUdfU1lTX0dCTF9EQVRBX09GRlNFVCkK
KyNkZWZpbmUgQ09ORklHX0JPQVJEX0VBUkxZX0lOSVRfRgorCiAvKiBwbGF0Zm9ybS5TIHNldHRp
bmdzICovCiAjZGVmaW5lIENPTkZJR19EUkFNX0VDQwogI2RlZmluZQlDT05GSUdfRFJBTV9FQ0Nf
U0laRQkJMHgyMDAwMDAwMAo=
--001a114fa73886293a0540825b75--
