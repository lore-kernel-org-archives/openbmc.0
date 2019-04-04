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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Zcmb4J6HzDqKP
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 20:17:50 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x349CWVF094098
 for <openbmc@lists.ozlabs.org>; Thu, 4 Apr 2019 05:17:47 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rne4bkn0a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 Apr 2019 05:17:47 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 4 Apr 2019 10:17:45 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 4 Apr 2019 10:17:43 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x349HgM648169000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Apr 2019 09:17:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E889A4062;
 Thu,  4 Apr 2019 09:17:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3BA4A405F;
 Thu,  4 Apr 2019 09:17:41 +0000 (GMT)
Received: from [9.202.13.25] (unknown [9.202.13.25])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  4 Apr 2019 09:17:41 +0000 (GMT)
To: "Tanous, Ed" <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Improvements required in bmcweb
Date: Thu, 4 Apr 2019 14:47:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------0FF76B6DEBF43BA72E38EB91"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040409-0012-0000-0000-0000030B2822
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040409-0013-0000-0000-00002143361B
Message-Id: <d901219e-2736-d51a-7e33-bec28d43a310@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-04_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=712 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904040065
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
X-List-Received-Date: Thu, 04 Apr 2019 09:17:52 -0000

This is a multi-part message in MIME format.
--------------0FF76B6DEBF43BA72E38EB91
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ed,

I am putting my points here, I found some functionalities missing in 
current bmcweb code.

1.

As part of redfish specification we need to support multi property 
update and if one of the property update is successful
then bmcweb need to send the 200 OK as well as the extended error info 
for the property where the implementation encounters the error.

Now in bmcweb we do the asio call one after other and pass the asynResp 
var in each property update and the
response code gets filled by each update call which seems to me is buggy.

Eg:  In any resource doPatch() if I do multiple asio calls for property 
update

          doPatch
          {     asio1(asynRep);
               asio2(asynRep);
               asio3(asynResp);
          }

Suppose in the above eg my third asio call gets failed(asio3) due to 
D-Bus call failure,
In that case asyncrep would have the internal server error(5XX), as per 
the spec the status code
should have been 200 if one of the property update is successful.

My proposal is to introduce a var in the "crow::res" structure, which 
will be true if any property update is successful,
and in the destructor of asyncRep(shared pointer around res) where we 
are calling the res.end(), we can check this var value,
if it is true then we can update the status code to 200 OK.

What is your view?

2.

Currently in bmcweb we are not mapping the dbus error to the actual 
error code, any dbus failure leads to "Internal Server error" which is 5XX.
Do we have some plan to map the D-bus error code to correct http code?


Regards
Ratan Gupta





--------------0FF76B6DEBF43BA72E38EB91
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><tt>Hi Ed,</tt><br>
    </p>
    <p><tt>I am putting my points here, I found some functionalities
        missing in current bmcweb code.</tt><br>
    </p>
    <p><tt>1.</tt><br>
    </p>
    <tt>As part of redfish specification we need to support multi
      property update and if one of the property update is successful</tt><tt><br>
    </tt><tt>then bmcweb need to send the 200 OK as well as the extended
      error info for the property where the implementation encounters
      the error.</tt><tt><br>
    </tt><br>
    <tt>Now in bmcweb we do the asio call one after other and pass the
      asynResp var in each property update and the</tt><br>
    <tt>response code gets filled by each update call which seems to me
      is buggy.</tt>
    <p><tt>Eg:  In any resource doPatch() if I do multiple asio calls
        for property update</tt></p>
    <tt>         doPatch</tt><tt><br>
    </tt><tt>         { </tt><tt>    asio1(asynRep);</tt><tt><br>
    </tt><tt>              asio2(asynRep);</tt><tt><br>
    </tt><tt>              asio3(asynResp);</tt><tt><br>
    </tt><tt>         }</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Suppose in the above eg my third asio call gets
      failed(asio3) due to D-Bus call failure,</tt><tt><br>
    </tt><tt>In that case asyncrep would have the internal server
      error(5XX), as per the spec the status code</tt><tt><br>
    </tt><tt>should have been 200 if one of the property update is
      successful.</tt><tt><br>
    </tt><br>
    <tt>My proposal is to introduce a var in the "crow::res" structure,
      which will be true if any property update is successful,</tt><br>
    <tt>and in the destructor of asyncRep(shared pointer around res)
      where we are calling the res.end(), we can check this var value,</tt><br>
    <tt>if it is true then we can update the status code to 200 OK.</tt><br>
    <br>
    <tt>What is your view?</tt><br>
    <tt></tt>
    <p><tt>2.<br>
      </tt></p>
    <tt>Currently in bmcweb we are not mapping the dbus error to the
      actual error code, any dbus failure leads to "Internal Server
      error" which is 5XX.</tt><br>
    <tt>Do we have some plan to map the D-bus error code to correct http
      code?</tt><br>
    <tt><br>
    </tt><br>
    <tt>Regards</tt><br>
    <tt>Ratan Gupta</tt><span id="output" class="style-scope
      gr-linked-text"><tt>       </tt>           </span><br>
    <span id="output" class="style-scope gr-linked-text"></span>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------0FF76B6DEBF43BA72E38EB91--
