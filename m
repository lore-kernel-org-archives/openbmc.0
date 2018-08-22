Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::234; helo=mail-qk0-x234.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MOJyfzyb"; 
 dkim-atps=neutral
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wBND0hmJzDqnw
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 12:30:19 +1000 (AEST)
Received: by mail-qk0-x234.google.com with SMTP id p71-v6so305014qka.9
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jgyThveiaQ1auk5p6+l89eV1atB5sDsOhaBNn2lZImU=;
 b=MOJyfzybIQsIVl3AJFvjUzE49/xcSAlBmeuwxMQFHP0dXqn2EjysMRxri7RUhOUmeR
 t2W5jrijtFaeuRopIAmyrfWr+syy+BoJQq9yQYoFUVrqvfRB0/U34nI0lMAgOj/l4Hig
 raGTCNjS+u07MYZA+3Rf+FjCfiAt2DREGPuOWERpo5rurBzZYAmIZ+hiV9eeITPYwmeG
 2MRphN3Wo1444JvkZR6nBwq7Q4al6qKzFq7BYupJSqOvZBdA24Zo3IEEq+6S+14G/SIr
 9nzQxzQ1wLjcXksWImNNuQjni1aNNbbfo0YZdHInadfXKyaDvh6N66EI55AW4o8Lie9n
 aA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jgyThveiaQ1auk5p6+l89eV1atB5sDsOhaBNn2lZImU=;
 b=tOLNf32PPN5d0+d4yYEt7j0AQqnyFKCayZUzWi2LrJHF4ZU1KKaI8nFktNOnnJb80A
 GC6Iw3ZdL2LefCPCSgC3PR8rwVS8dfwL2AvGFZJBmU+8pdySCPvzXgI+hPuX+0m6FiZq
 VRWSZLyyRB93cNmb9EzcQnjOwTivyuqmOLvmyQJYn3F88ExxwDQghSRRsZOwRbYZWkGq
 PMvVy5e74fIazpH5a5hXd+WW+t6rSm/ygxePB+fIxKPqfxu2Yk84LNff6TWfeyQ5RVqu
 BPFdbOdfGlr5GgN6nBNCgWOqGZxR1D2OpKcSsZYoYaq942XHZVoqycR2YpJA2vcboo7r
 XJHg==
X-Gm-Message-State: AOUpUlExglPVQ/oOYTIp5vwPboei0UFdyw5c2gXFl8e0tPDOj78f0AE2
 rdIitVPtgTaygpY0Qo3vRdPyODCGk3Y52sluJKI=
X-Google-Smtp-Source: AA+uWPynVP4FymLCtVT/9Ye/U0cpEl7A/+G5dKG81U07mZ2W0QFXcSZUktXrclNUKou35zGzKS+e87yl4j4cHOSNHHc=
X-Received: by 2002:a37:3c8d:: with SMTP id
 j135-v6mr46457452qka.73.1534905016907; 
 Tue, 21 Aug 2018 19:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cC25xbJZChsGEh1=yt5BnJjGufH2yEq5L-ws-2Y-H31gA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345832E11@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345832E11@ORSMSX114.amr.corp.intel.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 22 Aug 2018 10:30:05 +0800
Message-ID: <CAG9c7cD0CO59CiU8czWORY8ZMCf8xeemvp-bEA21Qv4QaNZ+eA@mail.gmail.com>
Subject: Re: UpdateService in Redfish
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004bfbd30573fcece2"
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
X-List-Received-Date: Wed, 22 Aug 2018 02:30:21 -0000

--0000000000004bfbd30573fcece2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ed,
Thanks for your response.

I tried to send POST request but got "Method Not Allowed".

curl -k -H "Content-Type: application/json" -X POST -d '{"data":
["10.99.240.105", "s2600wf-20180118092748.all.tar"]}'
https://root:0penBmc@10.99.241.36:883/redfish/v1/UpdateService

Please help correct if any typo.

Thanks.

BRs,
Henbin.

Tanous, Ed <ed.tanous@intel.com> =E6=96=BC 2018=E5=B9=B48=E6=9C=8821=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:07=E5=AF=AB=E9=81=93=EF=BC=9A

> Yes, it should work, although it=E2=80=99s relatively new, so it=E2=80=99=
s possible there
> are bugs or corner cases we haven=E2=80=99t hit yet.  If you find new iss=
ues, it
> would be great if you could file them against the bmcweb project.
>
>
>
> To use the endpoint, it should just be a matter of sending a POST request
> to the update URL containing the tarred image with the manifest in the
> body.  It works very similarly to the existing update endpoints, it just
> meets the Redfish specifications.
>
>
>
> One thing to watch out for is payload size.  Bmcweb imposes appropriate
> payload limits, but if you=E2=80=99re reverse proxying the server behind =
nginx, you
> might have nginx payload limits imposed and that=E2=80=99ll need to be up=
dated.
>
>
>
> -Ed
>
>
>
> *From:* Henbin Chang [mailto:henbinchang@gmail.com]
> *Sent:* Tuesday, August 21, 2018 1:02 AM
> *To:* Tanous, Ed <ed.tanous@intel.com>; OpenBMC Maillist <
> openbmc@lists.ozlabs.org>
> *Subject:* UpdateService in Redfish
>
>
>
> Hi Ed,
>
> I search the below commit in the bmcweb REPO.
>
>
>
> commit acb7cfb4b571bd2045b1d269625ba054806a466d
>
> Author: Jennifer Lee <jennifer1.lee@intel.com>
>
> Date:   Thu Jun 7 16:08:15 2018 -0700
>
>
>
>     Implement POST for redfish UpdateService
>
>
>
>     - POST an image file to /redfish/v1/UpdateServer uri will upload the
>
>       image and activate it
>
>     - Modified SoftwareInventoryCollection to list items with
>
>       xyz.openbmc_project.Software.Activation/Activation property as
>
>     "xyz.openbmc_project.Software.Activation.Activations.Active"
>
>     - SoftwareInventory odata.id is identified with DBus generated uuid
>
>
>
> May I know if BMC FW can be updated through UpdateService in Redfish?
>
> If yes, could you share how to use it?
>
>
>
> Besides that, I add some debug message in
> the redfish-core/lib/update_service.hpp but output nothing
>
>
>
> Could you give some suggestion?
>
> ...
>
> private:
>
>   void doGet(crow::Response &res, const crow::Request &req,
>
>              const std::vector<std::string> &params) override {
>
>     std::cout << "Henbin=3D" << __FILE__<< ": "<<__LINE__ << "\n";
>
>           BMCWEB_LOG_INFO << "Henbin=3D" << __FILE__<< ": "<<__LINE__ <<
> "\n";
>
>     res.jsonValue =3D Node::json;
>
>     res.end();
>
>   }
>
> ...
>
>
>
> Thanks.
>
>
>
> BRs,
>
> Henbin.
>

--0000000000004bfbd30573fcece2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div>Thanks for your response.</div><div><br></div><=
div>I tried to send POST request but got=C2=A0&quot;Method Not Allowed&quot=
;.</div><div><br></div><div>curl -k -H &quot;Content-Type: application/json=
&quot; -X POST -d &#39;{&quot;data&quot;: [&quot;10.99.240.105&quot;, &quot=
;s2600wf-20180118092748.all.tar&quot;]}&#39; <a href=3D"https://root:0penBm=
c@10.99.241.36:883/redfish/v1/UpdateService">https://root:0penBmc@10.99.241=
.36:883/redfish/v1/UpdateService</a><br></div><div><br></div><div>Please he=
lp=C2=A0correct if any typo.</div><div><br></div><div>Thanks.</div><div><br=
></div><div>BRs,</div><div>Henbin.</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com">ed.tanou=
s@intel.com</a>&gt; =E6=96=BC 2018=E5=B9=B48=E6=9C=8821=E6=97=A5 =E9=80=B1=
=E4=BA=8C =E4=B8=8B=E5=8D=8811:07=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_1672218689135872985WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Yes, it should work, although it=E2=
=80=99s relatively new, so it=E2=80=99s possible there are bugs or corner c=
ases we haven=E2=80=99t hit yet.=C2=A0 If you find new issues, it would be =
great
 if you could file them against the bmcweb project.<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">To use the endpoint, it should just b=
e a matter of sending a POST request to the update URL containing the tarre=
d image with the manifest in the body.=C2=A0 It works
 very similarly to the existing update endpoints, it just meets the Redfish=
 specifications.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">One thing to watch out for is payload=
 size.=C2=A0 Bmcweb imposes appropriate payload limits, but if you=E2=80=99=
re reverse proxying the server behind nginx, you might have
 nginx payload limits imposed and that=E2=80=99ll need to be updated.<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">-Ed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><a name=3D"m_1672218689135872985__MailEndCompose"><s=
pan style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;co=
lor:#1f497d"><u></u>=C2=A0<u></u></span></a></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"m_1672218689135872985______replyseparator=
"></a><b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif">From:</span></b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif"> Henbin Chang [mailto:<a href=3D"mailto:henbinch=
ang@gmail.com" target=3D"_blank">henbinchang@gmail.com</a>]
<br>
<b>Sent:</b> Tuesday, August 21, 2018 1:02 AM<br>
<b>To:</b> Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"=
_blank">ed.tanous@intel.com</a>&gt;; OpenBMC Maillist &lt;<a href=3D"mailto=
:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&g=
t;<br>
<b>Subject:</b> UpdateService in Redfish<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi Ed,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">I search the below commit in the=C2=A0bmcweb=C2=A0RE=
PO.<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">commit acb7cfb4b571bd2045b1d269625ba054806a466d<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Author: Jennifer Lee &lt;<a href=3D"mailto:jennifer1=
.lee@intel.com" target=3D"_blank">jennifer1.lee@intel.com</a>&gt;<u></u><u>=
</u></p>
</div>
<div>
<p class=3D"MsoNormal">Date:=C2=A0 =C2=A0Thu Jun 7 16:08:15 2018 -0700<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 Implement POST for redfish UpdateServi=
ce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 - POST an image file to /redfish/v1/Up=
dateServer uri will upload the<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 image and activate it<u></u><u>=
</u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 - Modified SoftwareInventoryCollection=
 to list items with<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 xyz.openbmc_project.Software.Ac=
tivation/Activation property as<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 &quot;xyz.openbmc_project.Software.Act=
ivation.Activations.Active&quot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 - SoftwareInventory <a href=3D"http://=
odata.id" target=3D"_blank">odata.id</a> is identified with DBus generated =
uuid<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">May I know if BMC FW can be updated through=C2=A0Upd=
ateService in Redfish?=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">If yes, could you share how to use it?<u></u><u></u>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Besides that, I add some debug message in the=C2=A0r=
edfish-core/lib/update_service.hpp=C2=A0but output nothing=C2=A0<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Could you give some suggestion?=C2=A0=C2=A0<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal">...<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">private:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 void doGet(crow::Response &amp;res, const cro=
w::Request &amp;req,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cons=
t std::vector&lt;std::string&gt; &amp;params) override {<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 std::cout &lt;&lt; &quot;Henbin=3D&quo=
t; &lt;&lt; __FILE__&lt;&lt; &quot;: &quot;&lt;&lt;__LINE__ &lt;&lt; &quot;=
\n&quot;;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BMCWEB_LOG_INFO &lt;&lt; &quot;Henbin=3D&quot; &lt;&lt; __FILE__&lt;&lt=
; &quot;: &quot;&lt;&lt;__LINE__ &lt;&lt; &quot;\n&quot;;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 res.jsonValue =3D Node::json;<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 res.end();<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 }<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">...<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">BRs,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Henbin.<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--0000000000004bfbd30573fcece2--
