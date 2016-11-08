Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tClQp3p2NzDt1p
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 21:09:22 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uA8A8Rea130740
 for <openbmc@lists.ozlabs.org>; Tue, 8 Nov 2016 05:09:20 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26kb49wurn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 05:09:19 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Tue, 8 Nov 2016 03:09:18 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 Nov 2016 03:09:17 -0700
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 2C6931FF001F;
 Tue,  8 Nov 2016 03:08:56 -0700 (MST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uA8A9GUS13304294; Tue, 8 Nov 2016 10:09:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0D21AC03A;
 Tue,  8 Nov 2016 05:09:15 -0500 (EST)
Received: from [9.193.119.244] (unknown [9.193.119.244])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 2E6BAAC040;
 Tue,  8 Nov 2016 05:09:14 -0500 (EST)
From: tomjose <tomjose@linux.vnet.ibm.com>
Subject: Re: Discussion on IPMI provider libraries
To: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <58208518.50202@linux.vnet.ibm.com>
 <CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com>
Date: Tue, 8 Nov 2016 15:39:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------020708000809010301060809"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16110810-0004-0000-0000-000010CEB34D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006041; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00778108; UDB=6.00374705; IPR=6.00555428; 
 BA=6.00004862; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013251; XFM=3.00000011;
 UTC=2016-11-08 10:09:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16110810-0005-0000-0000-00007A67E66B
Message-Id: <5821A449.3020807@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-08_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611080188
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
X-List-Received-Date: Tue, 08 Nov 2016 10:09:22 -0000

This is a multi-part message in MIME format.
--------------020708000809010301060809
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On Tuesday 08 November 2016 01:55 AM, Brendan Higgins wrote:
> Sharing the provider libraries makes sense; my first area of concern 
> is the API; I am currently working on a change to the API (see 
> https://gerrit.openbmc-project.xyz/#/c/841/ 
> <https://gerrit.openbmc-project.xyz/#/c/841/> for details); I would 
> prefer you do not make any changes to the current API, but understand 
> if the need arises before my change is ready.
 From what i have noticed in the patch, there is support for 
ipmid_callback_t handlers  as it is now. So the change in API is to 
accommodate the OEM group ?
So do you have plans to change the callback signatures for the standard 
commands already implemented in host-ipmid?

>
> Could you elaborate on how you plan on enforcing privilege? Having 
> each provider check privilege level seems like a leaky abstraction to 
> me; I think it would make more sense to have privilege managed by the 
> host-ipmid and the net-ipmid.
Table G - Command Number Assignments and Privilege Levels in the IPMI 
specification gives more details on this.

Each command is assigned a privilege level( Callback, User, Operator, 
Admin) which means that the command can be executed only on a session 
with this privilege or higher.
So if a command needs be executed on net-ipmid path, one of the 
attribute needed for net-ipmid is the command's privilege level.
The privilege provided by each command is a registration parameter and 
it is consumed only by net-ipmid.

As part of the same issue, i am separating commands that need to be 
executed from system interface as a separate library.

The provider libraries is now copied into /usr/lib/host-ipmid. The plan 
is to have the /usr/lib/ipmid-providers as the default install location 
for all providers
and then symlink into /usr/lib/host-ipmid and /usr/lib/net-ipmid 
depending on whether the provider library is needed in out-of-band or 
in-band path.
>
> As far as the actual details concerning phosphor-net-ipmid: I do not 
> have strong opinions on the matter as Google has no intention of using 
> IPMI over LAN at this time, but would welcome discussion on the matter 
> nonetheless.
>
> Cheers


--------------020708000809010301060809
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On Tuesday 08 November 2016 01:55 AM,
      Brendan Higgins wrote:<br>
    </div>
    <blockquote
cite="mid:CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">Sharing the provider libraries makes sense; my
        first area of concern is the API; I am currently working on a
        change to the API (see <a moz-do-not-send="true"
          href="https://gerrit.openbmc-project.xyz/#/c/841/"
          target="_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/841/</a> for

        details); I would prefer you do not make any changes to the
        current API, but understand if the need arises before my change
        is ready.</div>
    </blockquote>
    From what i have noticed in the patch, there is support for
    ipmid_callback_t handlers  as it is now. So the change in API is to
    accommodate the OEM group ?<br>
    So do you have plans to change the callback signatures for the
    standard commands already implemented in host-ipmid?<br>
    <br>
    <blockquote
cite="mid:CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><br class="gmail-Apple-interchange-newline">
          <span
            style="color:rgb(0,0,0);font-family:sans-serif;font-size:13px">Could

            you elaborate on how you plan on enforcing privilege? Having
            each provider check privilege level seems like a leaky
            abstraction to me; I think it would make more sense to have
            privilege managed by the host-ipmid and the net-ipmid.</span><br>
        </div>
      </div>
    </blockquote>
    Table G - Command Number Assignments and Privilege Levels in the
    IPMI specification gives more details on this. <br>
    <br>
    Each command is assigned a privilege level( Callback, User,
    Operator, Admin) which means that the command can be executed only
    on a session with this privilege or higher.<br>
    So if a command needs be executed on net-ipmid path, one of the
    attribute needed for net-ipmid is the command's privilege level.<br>
    The privilege provided by each command is a registration parameter
    and it is consumed only by net-ipmid.<br>
    <br>
    As part of the same issue, i am separating commands that need to be
    executed from system interface as a separate library. <br>
    <br>
    The provider libraries is now copied into /usr/lib/host-ipmid. The
    plan is to have the /usr/lib/ipmid-providers as the default install
    location for all providers<br>
    and then symlink into /usr/lib/host-ipmid and /usr/lib/net-ipmid
    depending on whether the provider library is needed in out-of-band
    or in-band path.<br>
    <blockquote
cite="mid:CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><br>
        </div>
        <div>As far as the actual details concerning <span
            style="color:rgb(33,33,33);font-family:&quot;helvetica
            neue&quot;,helvetica,arial,sans-serif">phosphor-net-ipmid: I
            do not have strong opinions on the matter as Google has no
            intention of using IPMI over LAN at this time, but would
            welcome discussion on the matter nonetheless.</span></div>
        <div><span
            style="color:rgb(33,33,33);font-family:&quot;helvetica
            neue&quot;,helvetica,arial,sans-serif"><br>
          </span></div>
        <div><span
            style="color:rgb(33,33,33);font-family:&quot;helvetica
            neue&quot;,helvetica,arial,sans-serif">Cheers</span></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020708000809010301060809--
