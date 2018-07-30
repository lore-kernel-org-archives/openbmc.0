Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fMKJ4BFgzF16W
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 00:24:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6UEEKOl022562
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 10:24:49 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kj45krrvt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 10:24:49 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 30 Jul 2018 15:24:46 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Jul 2018 15:24:44 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6UEOhu336503602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Jul 2018 14:24:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93BBB11C066;
 Mon, 30 Jul 2018 17:24:54 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F055F11C052;
 Mon, 30 Jul 2018 17:24:53 +0100 (BST)
Received: from [9.202.13.177] (unknown [9.202.13.177])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Jul 2018 17:24:53 +0100 (BST)
Subject: Re: SSSD flash size and the runtime size
To: richard.marian.thomaiyar@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <d08ad9f8-471f-27f4-4652-28c200dfb254@linux.vnet.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Mon, 30 Jul 2018 19:54:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d08ad9f8-471f-27f4-4652-28c200dfb254@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------CDD93365B967E1FB1987229A"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18073014-0008-0000-0000-00000259F544
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18073014-0009-0000-0000-000021C084F0
Message-Id: <f8ec986c-9737-23fa-4307-4dbc047e84cf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-30_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=9 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807300158
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
X-List-Received-Date: Mon, 30 Jul 2018 14:24:53 -0000

This is a multi-part message in MIME format.
--------------CDD93365B967E1FB1987229A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

More updates on the below.

Pulling the SSSD into the openbmc image increases the size of flash by 
8MB.I was looking at the rofs file size.In the 8MB
openldap is taking around 700 KB and rest has been taken by the SSSD and 
other dependent libraries.

Please find the configure command below for SSSD.

$ ../sssd-1.16.0/configure --build=x86_64-linux 
--host=arm-openbmc-linux-gnueabi --target=arm-openbmc-linux-gnueabi 
--prefix=/usr --exec_prefix=/usr
   --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec 
--datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com 
--localstatedir=/var
   --libdir=/usr/lib --includedir=/usr/include 
--oldincludedir=/usr/include --infodir=/usr/share/info 
--mandir=/usr/share/man --disable-silent-rules
   --disable-dependency-tracking 
--with-libtool-sysroot=/tmp/user/build/tmp/work/armv6-openbmc-linux-gnueabi/sssd/1.16.0-r0/recipe-sysroot 
--disable-cifs-idmap-plugin
   --without-nfsv4-idmapd-plugin --without-ipa-getkeytab 
--disable-krb5-locator-plugin --disable-static --without-secrets 
--without-kcm --without-secrets
   --with-manpages=no --with-libnl=no --with-nscd=/usr/sbin 
--with-crypto=nss --without-python2-bindings --without-python3-bindings 
--with-samba=no --with-selinux=no
   --with-semanage=no --with-ssh=no --with-systemdunitdir= --enable-nls

Regards
Ratan Gupta



On Monday 30 July 2018 11:46 AM, Ratan Gupta wrote:
>
> Hi Richard,
>
> Need the following info regarding the SSSD flash space size.
>
> What is the flash size after including the SSSD and it's dependencies 
> on Intel reference platform(s2600wf)?
>
> What is the runtime memory requirement for SSSD and its dependency?
>
> If I look at uncompressed data then alone SSSD(18M) + openLDAP(14M) is 
> taking 32M.I haven't added the size of
>
> other dependent recipes(cyrus-sasl libtdb ding-libs etc).Can you 
> please share your observation on this?
>
> Regards
>
> Ratan Gupta
>
>


--------------CDD93365B967E1FB1987229A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>Hi Richard,<br>
      <br>
      More updates on the below.<br>
      <br>
      Pulling the SSSD into the openbmc image increases the size of
      flash by 8MB.I was looking at the rofs file size.In the 8MB <br>
      openldap is taking around 700 KB and rest has been taken by the
      SSSD and other dependent libraries.<br>
      <br>
      Please find the configure command below for SSSD.<br>
      <br>
      $ ../sssd-1.16.0/configure --build=x86_64-linux
      --host=arm-openbmc-linux-gnueabi
      --target=arm-openbmc-linux-gnueabi --prefix=/usr
      --exec_prefix=/usr <br>
        --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec
      --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com
      --localstatedir=/var <br>
        --libdir=/usr/lib --includedir=/usr/include
      --oldincludedir=/usr/include --infodir=/usr/share/info
      --mandir=/usr/share/man --disable-silent-rules <br>
        --disable-dependency-tracking --with-libtool-sysroot=/tmp/user/build/tmp/work/armv6-openbmc-linux-gnueabi/sssd/1.16.0-r0/recipe-sysroot
      --disable-cifs-idmap-plugin<br>
        --without-nfsv4-idmapd-plugin --without-ipa-getkeytab
      --disable-krb5-locator-plugin --disable-static --without-secrets
      --without-kcm --without-secrets <br>
        --with-manpages=no --with-libnl=no --with-nscd=/usr/sbin
      --with-crypto=nss --without-python2-bindings
      --without-python3-bindings --with-samba=no --with-selinux=no <br>
        --with-semanage=no --with-ssh=no --with-systemdunitdir=
      --enable-nls<br>
      <br>
      Regards<br>
      Ratan Gupta<br>
      <br>
      <br>
      <br>
    </tt>
    <div class="moz-cite-prefix">On Monday 30 July 2018 11:46 AM, Ratan
      Gupta wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d08ad9f8-471f-27f4-4652-28c200dfb254@linux.vnet.ibm.com">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <p><tt>Hi Richard,</tt></p>
      <p><tt>Need the following info regarding the SSSD flash space
          size.</tt></p>
      <p><tt>What is the flash size after including the SSSD and it's
          dependencies on Intel reference platform(s2600wf)?</tt></p>
      <p><tt>What is the runtime memory requirement for SSSD and its
          dependency?</tt></p>
      <p><tt>If I look at uncompressed data then alone SSSD(18M) +
          openLDAP(14M) is taking 32M.I haven't added the size of<br>
        </tt></p>
      <p><tt>other dependent recipes(</tt><tt><span style="color: rgb(69, 69, 69); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">cyrus-sasl libtdb ding-libs etc</span>).Can
          you please share your observation on this?</tt></p>
      <p><tt>Regards</tt></p>
      <p><tt>Ratan Gupta<br>
        </tt></p>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------CDD93365B967E1FB1987229A--
