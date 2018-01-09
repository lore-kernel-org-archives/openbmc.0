Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFvV75PR5zF0cK
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 12:21:03 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w091KOf9134890
 for <openbmc@lists.ozlabs.org>; Mon, 8 Jan 2018 20:21:00 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fcjdkk9f8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jan 2018 20:20:59 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Mon, 8 Jan 2018 20:20:58 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 8 Jan 2018 20:20:56 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w091KtAJ50069546
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jan 2018 01:20:55 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 785A4B204D
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jan 2018 20:17:57 -0500 (EST)
Received: from [9.48.96.98] (unknown [9.48.96.98])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 17F45B2046
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jan 2018 20:17:56 -0500 (EST)
Subject: Re: systemd update for openbmc
To: openbmc@lists.ozlabs.org
References: <16379b3bfc8a4a1ca02a04aa49a60628@ausx13mpc109.AMER.DELL.COM>
 <CADfYTpG-=xveo0Kuc+V0WfTD+aiEiy_iMTJCxxROy+yW01L3fw@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Mon, 8 Jan 2018 19:20:55 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CADfYTpG-=xveo0Kuc+V0WfTD+aiEiy_iMTJCxxROy+yW01L3fw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------C2655EABEEA482B49D2BBF60"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18010901-0044-0000-0000-000003CB2EAB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008344; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00972257; UDB=6.00492534; IPR=6.00752207; 
 BA=6.00005767; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018933; XFM=3.00000015;
 UTC=2018-01-09 01:20:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18010901-0045-0000-0000-000007FA8565
Message-Id: <529f4ce1-35d3-5cb4-4e29-0e6e12864569@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-08_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=14 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801090014
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 01:21:04 -0000

This is a multi-part message in MIME format.
--------------C2655EABEEA482B49D2BBF60
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

We currently use systemd v232.
https://github.com/openbmc/openbmc/blob/master/import-layers/yocto-poky/meta/recipes-core/systemd/systemd_232.bb

Looks like that commit is included starting in systemd v233.

$git config --get remote.origin.url
git@github.com:systemd/systemd.gi

$git tag --contains aa3288505569433200bfa311ff12d29684a14374
v233
v234
v235
v236

Yocto Project 2.4 does update systemd to v234.

https://lists.yoctoproject.org/pipermail/yocto-announce/2017-October/000125.html

https://github.com/openbmc/openbmc/issues/2461 is the OpenBMC issue for 
updating to Yocto 2.4.

You could also look at including that patch in a systemd_%.bbappend.

Gunnar


On 1/8/2018 6:20 PM, Nancy Yuen wrote:
> I think systemd is a component that OpenBMC picks up when it updates 
> Yocto.  I think there was some rumblings about updating to Yocto 2.4.  
> I don't know what version of systemd is in it though.
>
> ----------
> Nancy
>
> On Fri, Jan 5, 2018 at 9:53 AM, <Balaji.B.Rao@dell.com 
> <mailto:Balaji.B.Rao@dell.com>> wrote:
>
>     systemd in openbmc repo seems a little outdated making it unable
>     to build with GNU c++ compilers. Is there a plan to update it?
>     Particularly interesting is the following fix,
>
>     https://github.com/systemd/systemd/commit/aa3288505569433200bfa311ff12d29684a14374
>     <https://github.com/systemd/systemd/commit/aa3288505569433200bfa311ff12d29684a14374>
>
>     Will systemd be updated anytime soon?
>
>     Thanks
>
>     Balaji
>
>


--------------C2655EABEEA482B49D2BBF60
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>We currently use systemd v232.<br>
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/blob/master/import-layers/yocto-poky/meta/recipes-core/systemd/systemd_232.bb">https://github.com/openbmc/openbmc/blob/master/import-layers/yocto-poky/meta/recipes-core/systemd/systemd_232.bb</a><br>
      <br>
      Looks like that commit is included starting in systemd v233. <br>
      <br>
      $git config --get remote.origin.url<br>
      <a class="moz-txt-link-abbreviated" href="mailto:git@github.com:systemd/systemd.gi">git@github.com:systemd/systemd.gi</a><br>
      <br>
      $git tag --contains aa3288505569433200bfa311ff12d29684a14374<br>
      v233<br>
      v234<br>
      v235<br>
      v236<br>
      <br>
      Yocto Project 2.4 does update systemd to v234.<br>
      <br>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/pipermail/yocto-announce/2017-October/000125.html">https://lists.yoctoproject.org/pipermail/yocto-announce/2017-October/000125.html</a><br>
          <br>
      <a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/issues/2461">https://github.com/openbmc/openbmc/issues/2461</a> is the OpenBMC
      issue for updating to Yocto 2.4.<br>
      <br>
      You could also look at including that patch in a
      systemd_%.bbappend. <br>
      <br>
      Gunnar<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 1/8/2018 6:20 PM, Nancy Yuen wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADfYTpG-=xveo0Kuc+V0WfTD+aiEiy_iMTJCxxROy+yW01L3fw@mail.gmail.com">
      <div dir="ltr">I think systemd is a component that OpenBMC picks
        up when it updates Yocto.  I think there was some rumblings
        about updating to Yocto 2.4.  I don't know what version of
        systemd is in it though.</div>
      <div class="gmail_extra"><br clear="all">
        <div>
          <div class="gmail_signature" data-smartmail="gmail_signature">----------<br>
            Nancy</div>
        </div>
        <br>
        <div class="gmail_quote">On Fri, Jan 5, 2018 at 9:53 AM, <span
            dir="ltr">&lt;<a href="mailto:Balaji.B.Rao@dell.com"
              target="_blank" moz-do-not-send="true">Balaji.B.Rao@dell.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div link="#0563C1" vlink="#954F72" lang="EN-US">
              <div class="m_-1858959768647120885WordSection1">
                <p class="MsoNormal">systemd in openbmc repo seems a
                  little outdated making it unable to build with GNU c++
                  compilers. Is there a plan to update it? Particularly
                  interesting is the following fix,</p>
                <p class="MsoNormal"> </p>
                <p class="MsoNormal"><a
href="https://github.com/systemd/systemd/commit/aa3288505569433200bfa311ff12d29684a14374"
                    target="_blank" moz-do-not-send="true">https://github.com/systemd/<wbr>systemd/commit/<wbr>aa3288505569433200bfa311ff12d2<wbr>9684a14374</a></p>
                <p class="MsoNormal"> </p>
                <p class="MsoNormal">Will systemd be updated anytime
                  soon?</p>
                <p class="MsoNormal"> </p>
                <p class="MsoNormal">Thanks</p>
                <p class="MsoNormal">Balaji</p>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------C2655EABEEA482B49D2BBF60--
