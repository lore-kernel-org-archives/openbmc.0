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
 by lists.ozlabs.org (Postfix) with ESMTPS id 447l3W4H5nzDq5W
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 14:41:26 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1Q3fGbh029751
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 22:41:22 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qvt12g8qh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 22:41:19 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 26 Feb 2019 03:39:51 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 26 Feb 2019 03:39:49 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1Q3dmnw60883038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Feb 2019 03:39:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42B194203F;
 Tue, 26 Feb 2019 03:39:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2146142041;
 Tue, 26 Feb 2019 03:39:47 +0000 (GMT)
Received: from [9.85.207.185] (unknown [9.85.207.185])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 26 Feb 2019 03:39:46 +0000 (GMT)
Subject: Re: Redfish: Design User authorization.
To: "Tanous, Ed" <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <b7596cbb-14f6-2d03-6860-840fb2ee7a7f@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E8216993459FE05D@ORSMSX114.amr.corp.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Tue, 26 Feb 2019 09:09:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993459FE05D@ORSMSX114.amr.corp.intel.com>
Content-Type: multipart/alternative;
 boundary="------------2199D4C5D1D69F3E71800479"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19022603-4275-0000-0000-00000313F0F2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022603-4276-0000-0000-000038222ED5
Message-Id: <89c3e6e6-88cd-a709-f5fb-180c543bf311@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260025
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
X-List-Received-Date: Tue, 26 Feb 2019 03:41:28 -0000

This is a multi-part message in MIME format.
--------------2199D4C5D1D69F3E71800479
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ed,

Please find my responses

Ratan


On 25/02/19 10:42 PM, Tanous, Ed wrote:
>> Hi Ed,
>>
>> This mail is regarding the authorization support on Redfish.
>>
> Thanks for pushing forward on this.  I think the best first step would be to review the patchset that's already in progress that's adding some infrastructure to do a lot of the things you're proposing.  If you're proposing an alternative approach than the existing review, and I misunderstood, apologies.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/15813
>
> I suspect the questions we need to answer are:
> 1. How do we determine a user's role?
*we can get the user role/privilege by calling the D-bus method on 
phosphor-user-manager.*

*Gerrit commit is up for the same.*

*https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/18132/
*

> 2. Given that privilege is required to service every request, do we need to cache it, or can we go to dbus for every request?
Once we get the user role/privilege, we will add the user role in the 
session object itself

during creation of the session so no need to make D-bus call for every 
request.

> 3. How is the cache invalidated?
Session would be invalidated during logout or session timeout.
>
> I think the bulk of the implementation will be filling out the method here:
> https://github.com/openbmc/bmcweb/blob/a24526dcf9ad8de2f0bd9dbd5fc746a130351a22/redfish-core/include/privileges.hpp#L229
>
> And moving roles away from the static implementation, as you've already determined.
>
> Do you have any intention to implement PrivilegeRegistry?
No, the intention is to call the get User Info function and add the User 
role into the session, so for each HTTP request we know the user 
privilege and compare it with the entity privilege.
>
> Looking forward to seeing your work here.
>
> -Ed

--------------2199D4C5D1D69F3E71800479
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><tt>Hi Ed,</tt></p>
    <p><tt>Please find my responses </tt><tt><br>
      </tt></p>
    <p><tt>Ratan</tt><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25/02/19 10:42 PM, Tanous, Ed wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:7E9441B1E5EFFD4681F54958E8216993459FE05D@ORSMSX114.amr.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi Ed,

This mail is regarding the authorization support on Redfish.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for pushing forward on this.  I think the best first step would be to review the patchset that's already in progress that's adding some infrastructure to do a lot of the things you're proposing.  If you're proposing an alternative approach than the existing review, and I misunderstood, apologies.

<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/15813">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/15813</a>

I suspect the questions we need to answer are:
1. How do we determine a user's role?</pre>
    </blockquote>
    <tt><b>we can get the user role/privilege by calling the D-bus
        method on phosphor-user-manager.</b></tt>
    <p><tt><b>Gerrit commit is up for the same.</b></tt></p>
    <p><b><tt><a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/18132/">https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/18132/</a><br>
        </tt></b></p>
    <blockquote type="cite"
cite="mid:7E9441B1E5EFFD4681F54958E8216993459FE05D@ORSMSX114.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">
2. Given that privilege is required to service every request, do we need to cache it, or can we go to dbus for every request?</pre>
    </blockquote>
    <tt>Once we get the user role/privilege, we will add the user role
      in the session object itself</tt><tt><br>
    </tt>
    <p><tt>during creation of the session so no need to make D-bus call
        for every request.</tt></p>
    <blockquote type="cite"
cite="mid:7E9441B1E5EFFD4681F54958E8216993459FE05D@ORSMSX114.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">
3. How is the cache invalidated?</pre>
    </blockquote>
    <tt>Session would be invalidated during logout or session timeout</tt>.<br>
    <blockquote type="cite"
cite="mid:7E9441B1E5EFFD4681F54958E8216993459FE05D@ORSMSX114.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

I think the bulk of the implementation will be filling out the method here:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/bmcweb/blob/a24526dcf9ad8de2f0bd9dbd5fc746a130351a22/redfish-core/include/privileges.hpp#L229">https://github.com/openbmc/bmcweb/blob/a24526dcf9ad8de2f0bd9dbd5fc746a130351a22/redfish-core/include/privileges.hpp#L229</a>

And moving roles away from the static implementation, as you've already determined.

Do you have any intention to implement PrivilegeRegistry?</pre>
    </blockquote>
    <tt>No, the intention is to call the get User Info function and add
      the User role into the session, so for each HTTP request we know
      the user privilege and compare it with the entity privilege.</tt><br>
    <blockquote type="cite"
cite="mid:7E9441B1E5EFFD4681F54958E8216993459FE05D@ORSMSX114.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

Looking forward to seeing your work here.

-Ed
</pre>
    </blockquote>
  </body>
</html>

--------------2199D4C5D1D69F3E71800479--
