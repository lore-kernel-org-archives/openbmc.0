Return-Path: <jaghu@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=209.85.218.46; helo=mail-oi0-f46.google.com;
 envelope-from=jaghu@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sssMWIJj"; 
 dkim-atps=neutral
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425rjZ4CXFzF3MV
 for <openbmc@lists.ozlabs.org>; Fri,  7 Sep 2018 05:48:43 +1000 (AEST)
Received: by mail-oi0-f46.google.com with SMTP id m11-v6so22912773oic.2
 for <openbmc@lists.ozlabs.org>; Thu, 06 Sep 2018 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0+X1AvJZUqH5hL5cv3vVOJZ2ONDkW5sIuKyySzRDqaI=;
 b=sssMWIJjM25yCJXwM0IrYpVbvWLDY58mTL2CrpM4JzcNmXFZDVVHDXVAp+OU3NNLiG
 Y4MFqFkvatDN7y8U5+rsSIfbJfL6503+mQOFnzT2XdllGDrCyJ9MLHk6eu9pqLY9vDIh
 swY/Wi7eQrZaRPsmve9c+bei+bJXsoo0pzekAZuya+JdsYfKb3m8drderBtuVqT1zAfH
 PGJH7yPOXuVRlOxwqOep3oUAAvKsSTcI28DyDQsX2YNvHSfCscChxZAt+pnBSAdJrNIY
 qdmZtoGatZYLPnVRApeWjBWeWGJyNRn/OlJPFSPjwaNEvqsHrsukcE4FFG8TJWLfMhyN
 S5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0+X1AvJZUqH5hL5cv3vVOJZ2ONDkW5sIuKyySzRDqaI=;
 b=d3+JTJifToCP1idZoW+tB7BmyUyMPlQNhayaa0rifLkZOTGmECyJwDADMKDbiymTl/
 yeHbnJtZKuQ3kcsDYraINKiqeSikoWSC7a1RlmJ+TtgRGfmzi/y79jcufxWhAPFYPtrA
 fR0ZllTlabfs11rpHsjIqv2EhTAyxUBZ63ZkeBBZmgLkj/3K11XcxDc4gKoP7Z4s3MTN
 oiiDEvTFpSxRdHGBxsfJgBOuLgHpubNpdNJ3PlTxvy0Xv8PRlG0YdVmjgvoraFjVyY1q
 u7jIIHojzrnuavICyl4LTtPVwwjY3N99PfFj/GnGahfKvHWhyxwnd+uKhtmrjeMJ4Qpk
 k/oA==
X-Gm-Message-State: APzg51B6cuV+/14Aatj0+11sNTlrkWAYwHvp3crZ4YIFiPNECqXeHMoH
 y+DcvaEe2sJGVqunhI/T0Pr16+q9WfRB7eANwlgjxiFHF1Q=
X-Google-Smtp-Source: ANB0VdafTWTclUDbGGKifVtx2J5tf30gtEwTdx8K+ggNq2GbbLKBPw8NVfywRyN/gJxtqwEsIw6568JB7XKYdgtGefo=
X-Received: by 2002:aca:684c:: with SMTP id
 d73-v6mr4331801oic.341.1536263320658; 
 Thu, 06 Sep 2018 12:48:40 -0700 (PDT)
MIME-Version: 1.0
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Thu, 6 Sep 2018 12:48:29 -0700
Message-ID: <CANsWYUXjgnsjeofaWsyEJTdXoajHCA9dOwuZKVnDGk7hJwGFhg@mail.gmail.com>
Subject: BMC sending info about which I2C bus goes to PCIe slot
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000083087e0575392d40"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 19:48:51 -0000

--00000000000083087e0575392d40
Content-Type: text/plain; charset="UTF-8"

Hello,

BMC has information in the device tree about which I2C bus goes to which
PCIe slot.
(for example in arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts file)
&i2c2 {
status = "okay";

/* 0: PCIe Slot 2,
*    Slot 3,
*    Slot 6,
*    Slot 7
*/
i2c-switch@74 {
compatible = "nxp,pca9546";
reg = <0x74>;
#address-cells = <1>;
#size-cells = <0>;
i2c-mux-idle-disconnect;  /* may use mux@77 next. */

i2c_pcie2: i2c@0 {
#address-cells = <1>;
#size-cells = <0>;
reg = <0>;
};

i2c_pcie3: i2c@1 {
#address-cells = <1>;
#size-cells = <0>;
reg = <1>;
};

}

I would like the host to get this information from the BMC firmware by
sending a IPMI OEM command.

I would like to add an extra property in the device tree like:

&i2c2 {
status = "okay";

/* 0: PCIe Slot 2,
 *    Slot 3,
 *    Slot 6,
 *    Slot 7
 */
i2c-switch@74 {
compatible = "nxp,pca9546";
reg = <0x74>;
#address-cells = <1>;
#size-cells = <0>;
i2c-mux-idle-disconnect;  /* may use mux@77 next. */

i2c_pcie2: i2c@0 {
#address-cells = <1>;
#size-cells = <0>;
reg = <0>;
                     *   slot = "PE2";*
};

i2c_pcie3: i2c@1 {
#address-cells = <1>;
#size-cells = <0>;
reg = <1>;
                        *slot = "PE3"*
};

}
Whenever the host sends the IPMI OEM command to get the I2C bus/PCIe slot
mapping info,
the BMC can parse through all the i2c devices under /sys/bus/i2c/ and find
only the i2c devices which have a property called slot under of_node. The
BMC can send then send the corresponding I2C bus number and the slot info
as part of the IPMI command response.


Does anyone have any ideas/suggestions about this ?

--00000000000083087e0575392d40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div dir=3D"ltr">BMC has i=
nformation in the device tree about which I2C bus goes to which PCIe slot.<=
div>(for example in arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts file)</div=
><div class=3D"gmail-navLinks gmail-desktop gmail-style-scope gmail-gr-diff=
-view" style=3D"box-sizing:border-box;margin:0px;padding:0px;border:0px;fon=
t-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inhe=
rit;font-size:13px;line-height:inherit;font-family:Roboto,-apple-system,sys=
tem-ui,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Em=
oji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;vertical-a=
lign:baseline;display:flex;white-space:nowrap;color:rgb(33,33,33)"><span st=
yle=3D"font-family:Arial,Helvetica,sans-serif;font-size:small;color:rgb(34,=
34,34)">&amp;i2c2 {</span></div><div><div><span style=3D"white-space:pre">	=
</span>status =3D &quot;okay&quot;;</div><div><br></div><div><span style=3D=
"white-space:pre">	</span>/* 0: PCIe Slot 2,</div><div><span style=3D"white=
-space:pre">	</span> *=C2=A0 =C2=A0 Slot 3,</div><div><span style=3D"white-=
space:pre">	</span> *=C2=A0 =C2=A0 Slot 6,</div><div><span style=3D"white-s=
pace:pre">	</span> *=C2=A0 =C2=A0 Slot 7</div><div><span style=3D"white-spa=
ce:pre">	</span> */</div><div><span style=3D"white-space:pre">	</span>i2c-s=
witch@74 {</div><div><span style=3D"white-space:pre">		</span>compatible =
=3D &quot;nxp,pca9546&quot;;</div><div><span style=3D"white-space:pre">		</=
span>reg =3D &lt;0x74&gt;;</div><div><span style=3D"white-space:pre">		</sp=
an>#address-cells =3D &lt;1&gt;;</div><div><span style=3D"white-space:pre">=
		</span>#size-cells =3D &lt;0&gt;;</div><div><span style=3D"white-space:pr=
e">		</span>i2c-mux-idle-disconnect;=C2=A0 /* may use mux@77 next. */</div>=
<div><br></div><div><span style=3D"white-space:pre">		</span>i2c_pcie2: i2c=
@0 {</div><div><span style=3D"white-space:pre">			</span>#address-cells =3D=
 &lt;1&gt;;</div><div><span style=3D"white-space:pre">			</span>#size-cells=
 =3D &lt;0&gt;;</div><div><span style=3D"white-space:pre">			</span>reg =3D=
 &lt;0&gt;;</div><div><span style=3D"white-space:pre">		</span>};</div><div=
><br></div><div><span style=3D"white-space:pre">		</span>i2c_pcie3: i2c@1 {=
</div><div><span style=3D"white-space:pre">			</span>#address-cells =3D &lt=
;1&gt;;</div><div><span style=3D"white-space:pre">			</span>#size-cells =3D=
 &lt;0&gt;;</div><div><span style=3D"white-space:pre">			</span>reg =3D &lt=
;1&gt;;</div><div><span style=3D"white-space:pre">		</span>};</div></div><d=
iv><br></div><div>}</div><div><br></div><div>I would like the host to get t=
his information from the BMC=C2=A0firmware by sending a IPMI OEM command.</=
div><div><br></div><div>I would like to add an extra property in the device=
 tree like:</div><div><br></div><div><div class=3D"gmail-navLinks gmail-des=
ktop gmail-style-scope gmail-gr-diff-view" style=3D"font-size:13px;box-sizi=
ng:border-box;margin:0px;padding:0px;border:0px;font-variant-numeric:inheri=
t;font-variant-east-asian:inherit;font-stretch:inherit;line-height:inherit;=
font-family:Roboto,-apple-system,system-ui,&quot;Segoe UI&quot;,Helvetica,A=
rial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&q=
uot;Segoe UI Symbol&quot;;vertical-align:baseline;display:flex;white-space:=
nowrap;color:rgb(33,33,33)"><span style=3D"font-family:Arial,Helvetica,sans=
-serif;font-size:small;color:rgb(34,34,34)">&amp;i2c2 {</span></div><div><d=
iv><span style=3D"white-space:pre">	</span>status =3D &quot;okay&quot;;</di=
v><div><br></div><div><span style=3D"white-space:pre">	</span>/* 0: PCIe Sl=
ot 2,</div><div><span style=3D"white-space:pre">	</span>=C2=A0*=C2=A0 =C2=
=A0 Slot 3,</div><div><span style=3D"white-space:pre">	</span>=C2=A0*=C2=A0=
 =C2=A0 Slot 6,</div><div><span style=3D"white-space:pre">	</span>=C2=A0*=
=C2=A0 =C2=A0 Slot 7</div><div><span style=3D"white-space:pre">	</span>=C2=
=A0*/</div><div><span style=3D"white-space:pre">	</span>i2c-switch@74 {</di=
v><div><span style=3D"white-space:pre">		</span>compatible =3D &quot;nxp,pc=
a9546&quot;;</div><div><span style=3D"white-space:pre">		</span>reg =3D &lt=
;0x74&gt;;</div><div><span style=3D"white-space:pre">		</span>#address-cell=
s =3D &lt;1&gt;;</div><div><span style=3D"white-space:pre">		</span>#size-c=
ells =3D &lt;0&gt;;</div><div><span style=3D"white-space:pre">		</span>i2c-=
mux-idle-disconnect;=C2=A0 /* may use mux@77 next. */</div><div><br></div><=
div><span style=3D"white-space:pre">		</span>i2c_pcie2: i2c@0 {</div><div><=
span style=3D"white-space:pre">			</span>#address-cells =3D &lt;1&gt;;</div=
><div><span style=3D"white-space:pre">			</span>#size-cells =3D &lt;0&gt;;<=
/div><div><span style=3D"white-space:pre">			</span>reg =3D &lt;0&gt;;</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0<b> =C2=A0 slot =3D &quot;PE2&quot;;</b></div><div><span style=3D"wh=
ite-space:pre">		</span>};</div><div><br></div><div><span style=3D"white-sp=
ace:pre">		</span>i2c_pcie3: i2c@1 {</div><div><span style=3D"white-space:p=
re">			</span>#address-cells =3D &lt;1&gt;;</div><div><span style=3D"white-=
space:pre">			</span>#size-cells =3D &lt;0&gt;;</div><div><span style=3D"wh=
ite-space:pre">			</span>reg =3D &lt;1&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <b>slot =3D =
&quot;PE3&quot;</b></div><div><span style=3D"white-space:pre">		</span>};</=
div></div><div><br></div><div>}</div></div><div>Whenever the host sends the=
 IPMI OEM command to get the I2C bus/PCIe slot mapping info,</div><div>the =
BMC can parse through all the i2c devices under /sys/bus/i2c/ and find only=
 the i2c devices which have a property called slot under of_node. The BMC c=
an send then send the corresponding I2C bus number and the slot info as par=
t of the IPMI command response.</div><div><br></div><div><br></div><div>Doe=
s anyone have any ideas/suggestions about this ?</div></div></div>

--00000000000083087e0575392d40--
