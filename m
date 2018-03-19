Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404lpx3Q0YzF1Vm
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 06:04:09 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2JIxlCd017921
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 15:04:07 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gtjb4sq0e-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 15:04:06 -0400
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Mon, 19 Mar 2018 19:04:04 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 19 Mar 2018 19:04:02 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2JJ41wi28836090; Mon, 19 Mar 2018 19:04:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19DB2AE045;
 Mon, 19 Mar 2018 18:54:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30139AE055;
 Mon, 19 Mar 2018 18:54:21 +0000 (GMT)
Received: from [9.124.219.99] (unknown [9.124.219.99])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Mar 2018 18:54:20 +0000 (GMT)
Subject: Re: IPMI SOL performance
To: Emily Shaffer <emilyshaffer@google.com>,
 Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Bradley W Bishop <bradleyb@us.ibm.com>
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
 <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
 <87y3iokp44.fsf@linux.vnet.ibm.com>
 <CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Tue, 20 Mar 2018 00:33:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------0CDF949902A517CD7C7C2D1C"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031919-0016-0000-0000-00000534F060
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031919-0017-0000-0000-000028720A2C
Message-Id: <1c20052d-f274-f821-4a68-591517f62537@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-19_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803190206
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 19:04:10 -0000

This is a multi-part message in MIME format.
--------------0CDF949902A517CD7C7C2D1C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On Tuesday 20 March 2018 12:17 AM, Emily Shaffer wrote:
>
>
> On Mon, Mar 19, 2018 at 9:27 AM Stewart Smith 
> <stewart@linux.vnet.ibm.com <mailto:stewart@linux.vnet.ibm.com>> wrote:
>
>     Emily Shaffer <emilyshaffer@google.com
>     <mailto:emilyshaffer@google.com>> writes:
>     >> Is it a possibility to just increase the petitboot timeout? Do
>     you have an
>     > idea of how much we are missing it by?
>
>     Worst case (may be different currently due to improvements in ipmi
>     stack) was about 10-15 minutes.
>
> Yikes.
>
>
>     We have different issues on the SSH console though, we can end up
>     dropping chunks of console output under load (BMC CPU load or high
>     console usage).
>
>     I think Jeremy can relive the trauma of heading into the TTY
>     layer, but
>     I wonder if the solution here has something to do with having a
>     end-to-end flow control story.
>
>     --
>     Stewart Smith
>     OPAL Architect, IBM.
>
>
> I was looking in the spec and I saw that the packet length for SOL is 
> configurable in the session header, but I didn't find the layout for 
> the header.  It's definitely not configurable past 255B?

Even though character data field is a variable length field, the 
accepted character count in the SOL payload is a single byte. It is 
based on the accepted character count that console acknowledges to BMC 
and offset is changed. That is the 255 character limitation mentioned.
>
> It really doesn't sound like IPMI is well-suited to this task.  Tom, 
> can you post a proposal for the OEM command you'd like to see, or if 
> you've tried one internally?
I haven't tried this option, the OEM option is to bump the accepted 
character count field. It will need changes on the clients (like ipmitool).


--------------0CDF949902A517CD7C7C2D1C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On Tuesday 20 March 2018 12:17 AM,
      Emily Shaffer wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com">
      <div dir="ltr"><br>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Mon, Mar 19, 2018 at 9:27 AM Stewart Smith
            &lt;<a href="mailto:stewart@linux.vnet.ibm.com"
              moz-do-not-send="true">stewart@linux.vnet.ibm.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Emily
            Shaffer &lt;<a href="mailto:emilyshaffer@google.com"
              target="_blank" moz-do-not-send="true">emilyshaffer@google.com</a>&gt;
            writes:<br>
            &gt;&gt; Is it a possibility to just increase the petitboot
            timeout? Do you have an<br>
            &gt; idea of how much we are missing it by?<br>
            <br>
            Worst case (may be different currently due to improvements
            in ipmi<br>
            stack) was about 10-15 minutes.</blockquote>
          <div>Yikes. </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"> </blockquote>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <br>
            We have different issues on the SSH console though, we can
            end up<br>
            dropping chunks of console output under load (BMC CPU load
            or high<br>
            console usage).<br>
            <br>
            I think Jeremy can relive the trauma of heading into the TTY
            layer, but<br>
            I wonder if the solution here has something to do with
            having a<br>
            end-to-end flow control story.<br>
            <br>
            --<br>
            Stewart Smith<br>
            OPAL Architect, IBM.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>I was looking in the spec and I saw that the packet
            length for SOL is configurable in the session header, but I
            didn't find the layout for the header.  It's definitely not
            configurable past 255B?</div>
        </div>
      </div>
    </blockquote>
    <br>
    Even though character data field is a variable length field, the
    accepted character count in the SOL payload is a single byte. It is
    based on the accepted character count that console acknowledges to
    BMC and offset is changed. That is the 255 character limitation
    mentioned.<br>
    <blockquote type="cite"
cite="mid:CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>It really doesn't sound like IPMI is well-suited to this
            task.  Tom, can you post a proposal for the OEM command
            you'd like to see, or if you've tried one internally?</div>
        </div>
      </div>
    </blockquote>
    I haven't tried this option, the OEM option is to bump the accepted
    character count field. It will need changes on the clients (like
    ipmitool).<br>
    <br>
  </body>
</html>

--------------0CDF949902A517CD7C7C2D1C--
