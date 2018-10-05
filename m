Return-Path: <subhakesh@yahoo.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yahoo.com
 (client-ip=98.137.69.84; helo=sonic314-21.consmr.mail.gq1.yahoo.com;
 envelope-from=subhakesh@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="J2IUw9TW"; 
 dkim-atps=neutral
Received: from sonic314-21.consmr.mail.gq1.yahoo.com
 (sonic314-21.consmr.mail.gq1.yahoo.com [98.137.69.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42RJ3W0gxLzF3L2
 for <openbmc@lists.ozlabs.org>; Fri,  5 Oct 2018 15:19:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1538716784; bh=v9d8B1Kot+ImZ8belTY6u+3NS4fYvC8TD/LzA1bJQvE=;
 h=Date:From:To:Subject:References:From:Subject;
 b=J2IUw9TWpb++bNTTBCViPDrYlGSEoS2m/PDoiweVna5B+Mf6pWSJJXw0MCcikDspkur3sbOYQGuMaQlLgVvNkD4ueS0XJu1l7SRHRnR+P5TfDM68Ehxgqfkx9hn6rjvpGv7ZOcWN00T04xr1bcqatoksyw4iYzFxPxFByXxlQ5RIxvqy2QvB1OpZw6sW4P+07pORWtYfwvYy5H2v6DXAaCnXuzYe0ImVGmrDCk8A/N0hESRznXFpdzU/zxsg7S6C+CcUOWoIRaECd2Y6CUsN1JArANMhCePUU4ubvt3KfL4bFi3+/lEZJgkTEP8ODWpPgYcuAM/N6OLWRjuaX9uiAA==
X-YMail-OSG: tOSX_BoVM1kYAgGkYQkfizp_CUaZSGd5ZYVKE1rRaVHTKAM.h9gKv.BBR4phSlv
 9wHAnJbE4U3zn0UnrfhMGhqMmrpWKD9lJ2q4vpyz5Btl84I0naK0O3KbB2pw3F74J2fSqqBL7Gw.
 .Rbi08CiW4trx7.8z1vocKSIwRYyK.0oDGpV1.aU7eCJMNZT9exDm4VDLBaGcZYzsBy5yAvCQ4cF
 60qaR0Yd5dS4cRcWMx4BCSUjvEQ86joE3Zm0KmYGetVQA7UlyERAx9FBcKvJ2hcBN9Pv7PmT3AA8
 ukkpKtvgMRPTELrlzhr4Priz.RbmFuqteluFCfjmIlzzKwwqtS.du71H47Gf4qE..PF1uJIoUqUf
 MNIYZ6ljwdMd46C2ARro3tAaRmYw.Pn43xRcNLWNtLMRb0lBc654eP8ITlZiL0cgjMvFQhJzSjCw
 xlfD41TUvi_UcNRIE.rNDIgxnMe3nAcvQusAJdYpg.F0HFBOTvD5GNA.AbYsqb2PXuejoI.hqoCo
 UCMEN06V7mSlmLds3JQcdGIHpyVR2hICY0w95p1HNhUxpH_DjDMgSwFEDS_cJw2tM95UNegGL8mW
 ocf2O82Ikhrnak2AdYXnLhHKQPd_dRzY4d8132WvHu0ezT9jXK1BK2jsua09NniXTqDYy36VAy4s
 ckAcMpr8jIG1cAkARSlacb.nGUgxILUApqiZp0eiArExFmU.u11.c_YmzeiAHOs3NNv79kDIJKoc
 7oWX7p_N_aPOva5eFjAYZKdlPqH_87XoLeWc5eEFk4vW6aFPwVEwjGSfUFEu6k4CZ3Qn3fsQV9PB
 MXGmoH6ltSMP5ZtP6ypMpakXT5sMO3DA0DKFS3tu49guHlCW1MQ_DV_jVlNe7beM_O0LumMN2lmJ
 mCTzwe3XctZHmttBSuQTW7yO5OPDyZHiLb14QMNEDNh3xArOiLpdQquElGNiMTasqhm4938Zk0sn
 fKjCoI7x_ujBCI5oa6aZJ6QRyzlbSdmJd_A9oBFViFHtJ_w3BTs2yKXAWSB1jGc7VdyoMVWhwSHV
 Zy5aKjA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Fri, 5 Oct 2018 05:19:44 +0000
Date: Fri, 5 Oct 2018 05:19:11 +0000 (UTC)
From: subha keshavaraj <subhakesh@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <1731248237.5011336.1538716751790@mail.yahoo.com>
Subject: FIQ handler for aspeed
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_5011335_1357661503.1538716751789"
References: <1731248237.5011336.1538716751790.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.12512 YMailNorrin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko)
 Chrome/69.0.3497.100 Safari/537.36
X-Mailman-Approved-At: Tue, 09 Oct 2018 09:45:20 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2018 05:19:52 -0000

------=_Part_5011335_1357661503.1538716751789
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,=C2=A0
=C2=A0 =C2=A0I am having trouble with invoking fiq handler on my FPGA watch=
dog timing out. I have already done the aspeed register initializations in =
u-boot and verified fiq is generated with a hardware probe.=C2=A0
Is there any sample code for setting up the fiq handler for aspeed 2500 g5 =
SOC? Any pointers would be helpful.
Thanks,Subha.
------=_Part_5011335_1357661503.1538716751789
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div style="font-family:courier new, courier, monaco, monospace, sans-serif;font-size:16px;"><div>Hi,&nbsp;</div><div><br></div><div>&nbsp; &nbsp;I am having trouble with invoking fiq handler on my FPGA watchdog timing out. <span><span style="color: rgb(0, 0, 0); font-family: &quot;courier new&quot;, courier, monaco, monospace, sans-serif; font-size: 16px;">I have already done the aspeed register initializations in u-boot and verified fiq is generated with a hardware probe.&nbsp;</span></span></div><div><br></div><div>Is there any sample code for setting up the fiq handler for aspeed 2500 g5 SOC? Any pointers would be helpful.</div><div><br></div><div>Thanks,</div><div>Subha.</div><div style="font-family:courier new, courier, monaco, monospace, sans-serif;font-size:16px;"></div></div></body></html>
------=_Part_5011335_1357661503.1538716751789--
