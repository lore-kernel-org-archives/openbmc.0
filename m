Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22a; helo=mail-qk0-x22a.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SH8+UKrE"; 
 dkim-atps=neutral
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com
 [IPv6:2607:f8b0:400d:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vjnD6G4MzF0pD
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 18:01:52 +1000 (AEST)
Received: by mail-qk0-x22a.google.com with SMTP id z78-v6so10461860qka.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QncO7o06gdOYIiXfuHXTDusAzpZGmOqhjf9OZ1XrbsY=;
 b=SH8+UKrEgx/XZlkM8YjOMTp4/rJ38cTHwOlsEzYCoq3tEMvq7fWu5Xn2/NQ0E0ROlB
 w1ZJUliRhQnBAlygBCrgr+o1JpETFMzzx+H+cc+fv7gnE8GReq0FULEFXcnaEtQhjVXE
 IVY1nWAZKjiWufhuRRJFRJ+qmwHucba5DZKkRt1FH3nq+xsHFaQ6b9OwhlVFXTSjF0pi
 QxtRR/G14mqQDTbIOeEZgW2b14F5lNRNkoVcKCqJ3B/GAn4kvr1K4Vh1Cf3I+SeqK9/e
 vNZRAOTsEXY5CXtkPoZBrKYb6YVdPdmSC8Nf4jIsYKS7VoLglFsXBIxOe1paSlYHxg+g
 rAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QncO7o06gdOYIiXfuHXTDusAzpZGmOqhjf9OZ1XrbsY=;
 b=fhfxZq+QjXsMsklL4MFreCzOiUBL+0+eipxAhQlCI22RYb/UL0dTbpw84bbgtd7PfD
 hr7X8ojLCYXw4cy70hq0YwoZQtQUuEqB62dSzyXK3xHuw4Ca/FB4S8PBU3wvj8rdBmYg
 mrwsjKtsUYUKTvlfqcA+MRAOZJuSSjbn1vz6SKDPrv0q00ZdVcNi55pbt9pByZOy9o4Y
 waOqN0Vh05YUDO8RgQ3sN/UDfDi932wK4pMwZewGTw/8F0BLQI6Niwi9YMgRycZ7NdM2
 xvqlaZ6tUWMrbOUzyH/1tDJnwcfE68a4vDlk0xPJ79mh0hCX9Dr5qwQ31/B7GVVRNnIR
 gjkw==
X-Gm-Message-State: AOUpUlFIMwVRNLwwM0om8Q0mZOcuc79h0O1KlSOgZ7yjyTrbcUsqtJFB
 3KKKJOQnf4cSY/hpTHtg6/Q1tUaRZptmyfrXGKA=
X-Google-Smtp-Source: AA+uWPwn8oHoo5cUrXcTtZVnN/Japi5DuoCnIbCSK8dtzNg3lS+VDLokFkZ+KdT3p/cnJ5esV5DRP9Vy+cj87/Z5CY0=
X-Received: by 2002:a37:7ac5:: with SMTP id
 v188-v6mr17438294qkc.262.1534838509751; 
 Tue, 21 Aug 2018 01:01:49 -0700 (PDT)
MIME-Version: 1.0
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 21 Aug 2018 16:01:38 +0800
Message-ID: <CAG9c7cC25xbJZChsGEh1=yt5BnJjGufH2yEq5L-ws-2Y-H31gA@mail.gmail.com>
Subject: UpdateService in Redfish
To: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000029513f0573ed707c"
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
X-List-Received-Date: Tue, 21 Aug 2018 08:01:54 -0000

--00000000000029513f0573ed707c
Content-Type: text/plain; charset="UTF-8"

Hi Ed,
I search the below commit in the bmcweb REPO.

commit acb7cfb4b571bd2045b1d269625ba054806a466d
Author: Jennifer Lee <jennifer1.lee@intel.com>
Date:   Thu Jun 7 16:08:15 2018 -0700

    Implement POST for redfish UpdateService

    - POST an image file to /redfish/v1/UpdateServer uri will upload the
      image and activate it
    - Modified SoftwareInventoryCollection to list items with
      xyz.openbmc_project.Software.Activation/Activation property as
    "xyz.openbmc_project.Software.Activation.Activations.Active"
    - SoftwareInventory odata.id is identified with DBus generated uuid

May I know if BMC FW can be updated through UpdateService in Redfish?
If yes, could you share how to use it?

Besides that, I add some debug message in
the redfish-core/lib/update_service.hpp but output nothing

Could you give some suggestion?
...
private:
  void doGet(crow::Response &res, const crow::Request &req,
             const std::vector<std::string> &params) override {
    std::cout << "Henbin=" << __FILE__<< ": "<<__LINE__ << "\n";
BMCWEB_LOG_INFO << "Henbin=" << __FILE__<< ": "<<__LINE__ << "\n";
    res.jsonValue = Node::json;
    res.end();
  }
...

Thanks.

BRs,
Henbin.

--00000000000029513f0573ed707c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div>I search the below commit in the=C2=A0bmcweb=C2=
=A0REPO.<br></div><div><div><br></div><div>commit acb7cfb4b571bd2045b1d2696=
25ba054806a466d</div><div>Author: Jennifer Lee &lt;<a href=3D"mailto:jennif=
er1.lee@intel.com">jennifer1.lee@intel.com</a>&gt;</div><div>Date:=C2=A0 =
=C2=A0Thu Jun 7 16:08:15 2018 -0700</div><div><br></div><div>=C2=A0 =C2=A0 =
Implement POST for redfish UpdateService</div><div><br></div><div>=C2=A0 =
=C2=A0 - POST an image file to /redfish/v1/UpdateServer uri will upload the=
</div><div>=C2=A0 =C2=A0 =C2=A0 image and activate it</div><div>=C2=A0 =C2=
=A0 - Modified SoftwareInventoryCollection to list items with</div><div>=C2=
=A0 =C2=A0 =C2=A0 xyz.openbmc_project.Software.Activation/Activation proper=
ty as</div><div>=C2=A0 =C2=A0 &quot;xyz.openbmc_project.Software.Activation=
.Activations.Active&quot;</div><div>=C2=A0 =C2=A0 - SoftwareInventory <a hr=
ef=3D"http://odata.id">odata.id</a> is identified with DBus generated uuid<=
/div></div><div><br></div><div>May I know if BMC FW can be updated through=
=C2=A0UpdateService in Redfish?=C2=A0</div><div>If yes, could you share how=
 to use it?</div><div><br></div><div>Besides that, I add some debug message=
 in the=C2=A0redfish-core/lib/update_service.hpp=C2=A0but output nothing=C2=
=A0</div><div><br></div><div>Could you give some suggestion?=C2=A0=C2=A0<br=
></div><div>...</div><div><div>private:</div><div>=C2=A0 void doGet(crow::R=
esponse &amp;res, const crow::Request &amp;req,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const std::vector&lt;std::string&gt; &amp;pa=
rams) override {</div><div>=C2=A0 =C2=A0 std::cout &lt;&lt; &quot;Henbin=3D=
&quot; &lt;&lt; __FILE__&lt;&lt; &quot;: &quot;&lt;&lt;__LINE__ &lt;&lt; &q=
uot;\n&quot;;</div><div><span style=3D"white-space:pre">	</span>BMCWEB_LOG_=
INFO &lt;&lt; &quot;Henbin=3D&quot; &lt;&lt; __FILE__&lt;&lt; &quot;: &quot=
;&lt;&lt;__LINE__ &lt;&lt; &quot;\n&quot;;</div><div>=C2=A0 =C2=A0 res.json=
Value =3D Node::json;</div><div>=C2=A0 =C2=A0 res.end();</div><div>=C2=A0 }=
</div></div><div>...</div><div><br></div><div>Thanks.<br></div><div><br></d=
iv><div>BRs,</div><div>Henbin.</div></div>

--00000000000029513f0573ed707c--
