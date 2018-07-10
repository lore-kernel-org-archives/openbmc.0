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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41PwVs2h8hzDr2J
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 18:34:57 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6A8YMpl142676
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 04:34:55 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2k4qtp7scx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 04:34:55 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 10 Jul 2018 09:34:53 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Jul 2018 09:34:51 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6A8Yor333882360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 08:34:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBA2D52051
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 11:35:12 +0100 (BST)
Received: from [9.79.192.194] (unknown [9.79.192.194])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 51F845204F
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 11:35:12 +0100 (BST)
Subject: Re: IPMI and Redfish support in openbmc Linux
To: openbmc@lists.ozlabs.org
References: <CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Tue, 10 Jul 2018 14:04:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------F862FEBF26AD19628CC24A7A"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18071008-0012-0000-0000-00000288866D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18071008-0013-0000-0000-000020BA2214
Message-Id: <57babd9a-22fd-093f-3edd-214642e0a016@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-10_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=12 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807100098
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
X-List-Received-Date: Tue, 10 Jul 2018 08:35:02 -0000

This is a multi-part message in MIME format.
--------------F862FEBF26AD19628CC24A7A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henbin,

Can you try "curl -b cjar -k https://<ip>:*18080*/redfish/v1"?

Ratan Gupta


On Tuesday 10 July 2018 10:06 AM, Henbin Chang wrote:
> H Ed,
> I built bmcweb into my machine, and check the 'bmcweb' daemon was 
> started up.
>
> ps aux | grep bmcweb
>   919 root       0:00 /usr/bin/bmcweb
>  8662 root       0:00 grep bmcweb
>
> But I couldn't access Redfish API through the below command.
> curl -b cjar -k https://10.99.241.79/redvish/v1/
>
> Could you help provide the suggestion?
>
> Thanks.
> -Henbin.
>
>     There are several servers that support Redfish, and we have a
>     working group that meets weekly to talk through technical issues
>     each week, which you're welcome to attend. The only one checked
>     into the upstream project is bmcweb. If you need help getting it
>     started, I'm happy to help.
>     https://github.com/openbmc/bmcweb
>
>


--------------F862FEBF26AD19628CC24A7A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Henbin,</p>
    <p>Can you try <span style="color: rgb(69, 69, 69); font-family:
        &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size:
        14px; font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: normal; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">"curl -b cjar -k <a class="moz-txt-link-freetext" href="https://">https://</a>&lt;ip&gt;:<b>18080</b>/redfish/v1"?</span></p>
    <p><span style="color: rgb(69, 69, 69); font-family: &quot;Open
        Sans&quot;, Arial, Helvetica, sans-serif; font-size: 14px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: normal; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">Ratan Gupta</span></p>
    <br>
    <div class="moz-cite-prefix">On Tuesday 10 July 2018 10:06 AM,
      Henbin Chang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <div dir="ltr">H Ed,
        <div>I built bmcweb into my machine, and check the 'bmcweb'
          daemon was started up.</div>
        <div><br>
        </div>
        <div>
          <div>ps aux | grep bmcweb</div>
          <div>  919 root       0:00 /usr/bin/bmcweb</div>
          <div> 8662 root       0:00 grep bmcweb</div>
        </div>
        <div><br>
        </div>
        <div>But I couldn't access Redfish API through the below
          command.</div>
        <div>curl -b cjar -k <a href="https://10.99.241.79/redvish/v1/"
            moz-do-not-send="true">https://10.99.241.79/redvish/v1/</a><br>
        </div>
        <div><br>
        </div>
        <div>Could you help provide the suggestion?</div>
        <div><br>
        </div>
        <div>Thanks.</div>
        <div>-Henbin.</div>
        <div>
          <div><br>
          </div>
          <div>
            <blockquote style="margin:0px 0px 0px 0.8ex;border-left:1px
              solid rgb(204,204,204);padding-left:1ex"
              class="gmail_quote">There are several servers that support
              Redfish, and we have a working group that meets weekly to
              talk through technical issues each week, which you're
              welcome to attend. The only one checked into the upstream
              project is bmcweb. If you need help getting it started,
              I'm happy to help.<br>
              <a href="https://github.com/openbmc/bmcweb"
                moz-do-not-send="true">https://github.com/openbmc/bmcweb</a></blockquote>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------F862FEBF26AD19628CC24A7A--
