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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R5P749R5zF35b
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 16:19:07 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6C6J29S037888
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 02:19:04 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2k5w6jhbdv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 02:19:04 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 12 Jul 2018 07:18:59 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Jul 2018 07:18:58 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6C6IvQ928573718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 06:18:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C55FEA405F
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 09:19:18 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70201A4057
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 09:19:18 +0100 (BST)
Received: from [9.202.13.177] (unknown [9.202.13.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 09:19:18 +0100 (BST)
Subject: Re: IPMI user account with LDAP/Active Directory
To: openbmc@lists.ozlabs.org
References: <dd593784-d650-0393-0e44-3f6a5bcbdfec@linux.vnet.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Thu, 12 Jul 2018 11:48:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <dd593784-d650-0393-0e44-3f6a5bcbdfec@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------0D5325A3226B389719F1B411"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18071206-0020-0000-0000-000002A5A0F9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18071206-0021-0000-0000-000020F1EB46
Message-Id: <b50089f7-52be-fff7-7c53-9e11dc7c5baa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-12_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807120066
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
X-List-Received-Date: Thu, 12 Jul 2018 06:19:08 -0000

This is a multi-part message in MIME format.
--------------0D5325A3226B389719F1B411
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tom.

 > As IPMI requires clear text password my understanding is that LDAP/AD 
is not suitable for IPMI user account management.
Is the purpose of LDAP/AD to support authentication from UI along with 
IPMI user accounts on the BMC?
Also LDAP/AD cannot be used for IPMI session setup as passwords are 
stored as one-way hash and cannot be retrieved.

Seems ldap gets the way through which we can access the password.

e.g.

|sudo ldapsearch -H ldapi:// -LLL -Q -Y EXTERNAL -b "cn=config" 
"(olcRootDN=*)" dn olcRootDN olcRootPW Regards Ratan Gupta |



On Tuesday 10 July 2018 12:44 AM, Tom Joseph wrote:
> Hello,
>
> I came across the user guide of MegaRAC, SuperMicro etc mentioning 
> about the LDAP/Active directory settings.
> (Example: 
> https://argonsys.com/learn-microsoft-cloud/articles/supermicro-ipmi-active-directory-integration/)
>
> As IPMI requires clear text password my understanding is that LDAP/AD 
> is not suitable for IPMI user account management.
> Is the purpose of LDAP/AD to support authentication from UI along with 
> IPMI user accounts on the BMC?
> Also LDAP/AD cannot be used for IPMI session setup as passwords are 
> stored as one-way hash and cannot be retrieved.
>
> Any thoughts?
>
> Regards,
> Tom
>


--------------0D5325A3226B389719F1B411
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Tom.</p>
    <p>&gt; As IPMI requires clear text password my understanding is
      that LDAP/AD is not suitable for IPMI user account management.
      <br>
      Is the purpose of LDAP/AD to support authentication from UI along
      with IPMI user accounts on the BMC?
      <br>
      Also LDAP/AD cannot be used for IPMI session setup as passwords
      are stored as one-way hash and cannot be retrieved. <br>
    </p>
    <p>Seems ldap gets the way through which we can access the password.</p>
    <p>e.g.</p>
    <pre class="code-pre command"><code>sudo ldapsearch -H ldapi:// -LLL -Q -Y EXTERNAL -b "cn=config" "(olcRootDN=*)" dn olcRootDN olcRootPW

Regards
Ratan Gupta 
</code></pre>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On Tuesday 10 July 2018 12:44 AM, Tom
      Joseph wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:dd593784-d650-0393-0e44-3f6a5bcbdfec@linux.vnet.ibm.com">Hello,
      <br>
      <br>
      I came across the user guide of MegaRAC, SuperMicro etc mentioning
      about the LDAP/Active directory settings.
      <br>
      (Example:
<a class="moz-txt-link-freetext" href="https://argonsys.com/learn-microsoft-cloud/articles/supermicro-ipmi-active-directory-integration/">https://argonsys.com/learn-microsoft-cloud/articles/supermicro-ipmi-active-directory-integration/</a>)<br>
      <br>
      As IPMI requires clear text password my understanding is that
      LDAP/AD is not suitable for IPMI user account management.
      <br>
      Is the purpose of LDAP/AD to support authentication from UI along
      with IPMI user accounts on the BMC?
      <br>
      Also LDAP/AD cannot be used for IPMI session setup as passwords
      are stored as one-way hash and cannot be retrieved.
      <br>
      <br>
      Any thoughts?
      <br>
      <br>
      Regards,
      <br>
      Tom
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------0D5325A3226B389719F1B411--
