Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41hkL91ckDzF2D8
 for <openbmc@lists.ozlabs.org>; Fri,  3 Aug 2018 20:48:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w73Ahq7s015513
 for <openbmc@lists.ozlabs.org>; Fri, 3 Aug 2018 06:48:45 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kmknm4nfk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 03 Aug 2018 06:48:43 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Fri, 3 Aug 2018 11:48:40 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Aug 2018 11:48:39 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w73AmckF42205278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 Aug 2018 10:48:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF7B1A4040;
 Fri,  3 Aug 2018 13:48:47 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 321C0A405B;
 Fri,  3 Aug 2018 13:48:47 +0100 (BST)
Received: from [9.195.36.49] (unknown [9.195.36.49])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Aug 2018 13:48:46 +0100 (BST)
Subject: Re: SSSD flash size and the runtime size
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
To: richard.marian.thomaiyar@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <d08ad9f8-471f-27f4-4652-28c200dfb254@linux.vnet.ibm.com>
 <f8ec986c-9737-23fa-4307-4dbc047e84cf@linux.vnet.ibm.com>
Date: Fri, 3 Aug 2018 16:18:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f8ec986c-9737-23fa-4307-4dbc047e84cf@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------E0A01007BDF0587E694C415E"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18080310-0008-0000-0000-0000025C4AB3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18080310-0009-0000-0000-000021C2EE9D
Message-Id: <d1f8d9fe-3135-5dce-635e-aa8fd5611258@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=9 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808030120
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
X-List-Received-Date: Fri, 03 Aug 2018 10:48:49 -0000

This is a multi-part message in MIME format.
--------------E0A01007BDF0587E694C415E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

As per the below mail sssd is heavy and we can not contain it in the 
32MB flash size of witherspoon(ibm system) so we are proceeding with

pam_ldap + openldap.

pam_ldap would use the openldap as LDAP client library.

Can you please share your thoughts how much size sssd is taking in intel 
platforms?

Were you able to reduce the flash size of sssd?

Regards

Ratan Gupta




On Monday 30 July 2018 07:54 PM, Ratan Gupta wrote:
> Hi Richard,
>
> More updates on the below.
>
> Pulling the SSSD into the openbmc image increases the size of flash by 
> 5MB.I was looking at the rofs file size.In the 5MB
> openldap is taking around 700 KB and rest has been taken by the SSSD 
> and other dependent libraries.
>
> Please find the configure command below for SSSD.
>
> $ ../sssd-1.16.0/configure --build=x86_64-linux 
> --host=arm-openbmc-linux-gnueabi --target=arm-openbmc-linux-gnueabi 
> --prefix=/usr --exec_prefix=/usr
>   --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec 
> --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com 
> --localstatedir=/var
>   --libdir=/usr/lib --includedir=/usr/include 
> --oldincludedir=/usr/include --infodir=/usr/share/info 
> --mandir=/usr/share/man --disable-silent-rules
>   --disable-dependency-tracking 
> --with-libtool-sysroot=/tmp/user/build/tmp/work/armv6-openbmc-linux-gnueabi/sssd/1.16.0-r0/recipe-sysroot 
> --disable-cifs-idmap-plugin
>   --without-nfsv4-idmapd-plugin --without-ipa-getkeytab 
> --disable-krb5-locator-plugin --disable-static --without-secrets 
> --without-kcm --without-secrets
>   --with-manpages=no --with-libnl=no --with-nscd=/usr/sbin 
> --with-crypto=nss --without-python2-bindings 
> --without-python3-bindings --with-samba=no --with-selinux=no
>   --with-semanage=no --with-ssh=no --with-systemdunitdir= --enable-nls
>
> Regards
> Ratan Gupta
>
>
>
> On Monday 30 July 2018 11:46 AM, Ratan Gupta wrote:
>>
>> Hi Richard,
>>
>> Need the following info regarding the SSSD flash space size.
>>
>> What is the flash size after including the SSSD and it's dependencies 
>> on Intel reference platform(s2600wf)?
>>
>> What is the runtime memory requirement for SSSD and its dependency?
>>
>> If I look at uncompressed data then alone SSSD(18M) + openLDAP(14M) 
>> is taking 32M.I haven't added the size of
>>
>> other dependent recipes(cyrus-sasl libtdb ding-libs etc).Can you 
>> please share your observation on this?
>>
>> Regards
>>
>> Ratan Gupta
>>
>>
>


--------------E0A01007BDF0587E694C415E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><tt>Hi Richard,</tt></p>
    <p><tt>As per the below mail sssd is heavy and we can not contain it
        in the 32MB flash size of witherspoon(ibm system)</tt> <tt>so
        we are proceeding with</tt></p>
    <p><tt>pam_ldap + openldap.</tt></p>
    <p><tt>pam_ldap would use the openldap as LDAP client library.<br>
      </tt></p>
    <p><tt>Can you please share your thoughts how much size sssd is
        taking in intel platforms?</tt></p>
    <p><tt>Were you able to reduce the flash size of sssd?</tt></p>
    <p><tt>Regards</tt></p>
    <p><tt>Ratan Gupta<br>
      </tt></p>
    <p><tt> </tt><br>
    </p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On Monday 30 July 2018 07:54 PM, Ratan
      Gupta wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f8ec986c-9737-23fa-4307-4dbc047e84cf@linux.vnet.ibm.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <tt>Hi Richard,<br>
        <br>
        More updates on the below.<br>
        <br>
        Pulling the SSSD into the openbmc image increases the size of
        flash by 5MB.I was looking at the rofs file size.In the 5MB <br>
        openldap is taking around 700 KB and rest has been taken by the
        SSSD and other dependent libraries.<br>
        <br>
        Please find the configure command below for SSSD.<br>
        <br>
        $ ../sssd-1.16.0/configure --build=x86_64-linux
        --host=arm-openbmc-linux-gnueabi
        --target=arm-openbmc-linux-gnueabi --prefix=/usr
        --exec_prefix=/usr <br>
          --bindir=/usr/bin --sbindir=/usr/sbin
        --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc
        --sharedstatedir=/com --localstatedir=/var <br>
          --libdir=/usr/lib --includedir=/usr/include
        --oldincludedir=/usr/include --infodir=/usr/share/info
        --mandir=/usr/share/man --disable-silent-rules <br>
          --disable-dependency-tracking
--with-libtool-sysroot=/tmp/user/build/tmp/work/armv6-openbmc-linux-gnueabi/sssd/1.16.0-r0/recipe-sysroot
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
      <div class="moz-cite-prefix">On Monday 30 July 2018 11:46 AM,
        Ratan Gupta wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:d08ad9f8-471f-27f4-4652-28c200dfb254@linux.vnet.ibm.com">
        <meta http-equiv="content-type" content="text/html;
          charset=utf-8">
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
    </blockquote>
    <br>
  </body>
</html>

--------------E0A01007BDF0587E694C415E--
