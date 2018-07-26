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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41brdB1zHPzF0dm
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 22:14:53 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6QC4h8B117964
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 08:14:51 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kfd4jtnht-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 08:14:50 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 26 Jul 2018 13:14:48 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Jul 2018 13:14:45 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6QCEjlv40698084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 12:14:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D44E2AE057
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 15:14:51 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85AD0AE055
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 15:14:51 +0100 (BST)
Received: from [9.202.13.177] (unknown [9.202.13.177])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 15:14:51 +0100 (BST)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: RFC: LDAP Configuration
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 26 Jul 2018 17:44:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------C66C3402859314A0F404A831"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18072612-0008-0000-0000-000002580B7C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18072612-0009-0000-0000-000021BE8A3E
Message-Id: <88496648-6c50-a71e-e61f-25dfb7f8dacd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-26_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=928 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807260128
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
X-List-Received-Date: Thu, 26 Jul 2018 12:14:54 -0000

This is a multi-part message in MIME format.
--------------C66C3402859314A0F404A831
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

Regarding Git hub issue : https://github.com/openbmc/openbmc/issues/3305

Per my analysis following are the desired/mandatory parameters which 
needs to be configured -

1) Global for all LDAP servers

LDAP certificate configuration(/assuming same certificate can be used 
for all the LDAP servers in the case of secure ldap/).

Certificate configuration would be done with separate activity.


2) Specific to each LDAP server

     a)LDAP server IP

     b)Secure v/s Non secure LDAP

     c)Search Base: Where the search should start on the ldap server

     d)Scope of the search: One level or search till the end of the tree.

Users would be allowed to configure multiple LDAP servers.


_*Methods to configure*_

Option 1) Define the D-Bus API which takes all these parameters and 
updates the configuration files accordingly.

/Pros: Not tied to a specific ldap client(sssd/openLDAP)/


Option 2) Upload the configuration file directly(/sssd.conf //&//ldap.conf/)

/Cons: Additional overhead of doing file parsing and more bad path 
validations than option 1)/

/In the option2 don't do any validation and copy the conf file but 
expecting user should validate the correctness of the conf file.
/

/Need opinion from the community members on this proposal on the methods 
to configure./

/Regards/

/Ratan Gupta
/


--------------C66C3402859314A0F404A831
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>
      <style type="text/css">p { margin-bottom: 0.25cm; line-height: 120%; }a:link {  }</style>
    </p>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>Hi
          All,</tt></font></p>
    <font size="+1"><tt></tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>Regarding
          Git hub issue :
        </tt><tt><a
            href="https://github.com/openbmc/openbmc/issues/3305">https://github.com/openbmc/openbmc/issues/3305</a></tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>Per
          my analysis
          following are the desired/mandatory parameters which needs to
          be
          configured -</tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>1)
          Global for all
          LDAP servers</tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>
          LDAP
          certificate configuration(</tt><tt><i>assuming same
            certificate can be used
            for all the LDAP servers in the case of secure ldap</i></tt><tt>).</tt></font></p>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>Certificate
          configuration would be done with separate activity. <br>
        </tt></font></p>
    <font size="+1"><tt><br>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>2)
          Specific to each
          LDAP server</tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>
              a)LDAP server IP</tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>
              b)Secure v/s Non
          secure LDAP</tt><tt><br>
        </tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>
              c)Search Base:
          Where the search should start on the ldap server</tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>
              d)Scope of the
          search: One level or search till the end of the tree.</tt></font></p>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>Users
          would be allowed to configure multiple LDAP servers.<br>
        </tt></font></p>
    <font size="+1"><tt><br>
      </tt><tt></tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt><u><b>Methods
              to
              configure</b></u></tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"> </p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>Option
          1) Define the D-Bus API which takes all these parameters and
          updates the
          configuration files accordingly. </tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt><i>Pros:
            Not tied to
            a specific ldap client(sssd/openLDAP)</i></tt></font></p>
    <font size="+1"><tt>
      </tt><tt><br>
      </tt><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt>Option
          2) Upload the
          configuration file directly(</tt><tt><i>sssd.conf </i></tt><tt><i>&amp;</i></tt><tt><i>
            ldap.conf</i></tt><tt>)</tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt><i>Cons:
            Additional
            overhead of doing file parsing and more bad path validations
            than
            option 1)</i></tt></font></p>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt><i>In
            the option2 don't do any validation and copy the conf file
            but expecting user should validate the correctness of the
            conf file.<br>
          </i></tt></font></p>
    <font size="+1"><tt>
      </tt></font>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt><i>Need
            opinion from
            the community members on this proposal on the methods to
            configure.</i></tt></font></p>
    <p style="margin-bottom: 0cm; line-height: 100%"><font size="+1"><tt><i>Regards</i></tt></font></p>
    <p style="margin-bottom: 0cm; line-height: 100%"><i><font size="+1"><tt>Ratan
            Gupta</tt></font><br>
      </i></p>
  </body>
</html>

--------------C66C3402859314A0F404A831--
