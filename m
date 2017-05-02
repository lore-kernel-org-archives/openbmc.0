Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHZ3F68MmzDq9m
 for <openbmc@lists.ozlabs.org>; Wed,  3 May 2017 07:21:13 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v42L9qM9124470
 for <openbmc@lists.ozlabs.org>; Tue, 2 May 2017 17:21:07 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2a6t1nj0e9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 17:21:06 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Tue, 2 May 2017 17:21:06 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 2 May 2017 17:21:04 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v42LL31t44105742; Tue, 2 May 2017 21:21:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AE1528046;
 Tue,  2 May 2017 17:20:58 -0400 (EDT)
Received: from [9.10.255.113] (unknown [9.10.255.113])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 1D6FC2803F;
 Tue,  2 May 2017 17:20:58 -0400 (EDT)
Subject: Re: OpenBMC Thermal Design
To: Patrick Venture <venture@google.com>
References: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
 <20170418023159.GA25774@heinlein.lan>
 <CAO=notww5QJUuMpc8qYxey+AH4mvi6eb+VXs=dqzvAyP9P1y0Q@mail.gmail.com>
 <290c826d-da59-2bed-ecee-7aa1f778ab71@linux.vnet.ibm.com>
 <CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
Date: Tue, 2 May 2017 16:21:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8104484878CFC779E743B8AB"
X-TM-AS-GCONF: 00
x-cbid: 17050221-0008-0000-0000-0000020DD313
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007013; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00855350; UDB=6.00423314; IPR=6.00634511; 
 BA=6.00005322; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015274; XFM=3.00000014;
 UTC=2017-05-02 21:21:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050221-0009-0000-0000-000035153231
Message-Id: <4f971554-1f33-c7ab-c0b5-3105c3505083@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-02_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705020106
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
X-List-Received-Date: Tue, 02 May 2017 21:21:14 -0000

This is a multi-part message in MIME format.
--------------8104484878CFC779E743B8AB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/17 2:33 PM, Patrick Venture wrote:
> Please elaborate on the format or layout of the control configuration 
> file.
This will be a yaml file containing the zone and fan definitions with 
the associated set of parameters that feed into the control algorithm. 
Currently this contains the zone number, the zone initial speed, and the 
list of fans(including their inventory path, sensor name, etc...).
> Please elaborate on the mechanism planned to import it into code?  
> Y'all often use python programs to make c++, will that be the case here?
Correct, that will be the case here as well.
> Please elaborate on how the control program will execute it's 
> "pluggable" algorithm?
Filling out the associated yaml file for the control application defines 
how the algorithm will control the fan speeds based on the values, 
sensors listed, delays, etc.. that will be supported as parameter inputs 
to the algorithm.
> Please elaborate on how the fans will be controlled?  Will that be as 
> a group per system or independently per zone?
This will be configurable by the yaml file where the fan speeds are set 
on the zone, which a zone is a group of fans. These zones can be 
constructed as 1-to-many fans enabling individual fans being controlled 
or a group of fans being controlled similarly.
>   -- What is a zone?
A grouping of fans
>
> Patrick
>
> On Tue, May 2, 2017 at 11:07 AM, Matthew Barth 
> <msbarth@linux.vnet.ibm.com <mailto:msbarth@linux.vnet.ibm.com>> wrote:
>
>     Patrick,
>
>     As Patrick mentioned a few of us have been working on the fan
>     control infrastructure currently and wrote up a quick outline to
>     share our thoughts on the design layout. Let us know if there are
>     areas you'd like to see more detail.
>
>     Matt
>
>


--------------8104484878CFC779E743B8AB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 05/02/17 2:33 PM, Patrick Venture wrote:<br>
    <blockquote
cite="mid:CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com"
      type="cite">
      <div dir="ltr">Please elaborate on the format or layout of the
        control configuration file.</div>
    </blockquote>
    This will be a yaml file containing the zone and fan definitions
    with the associated set of parameters that feed into the control
    algorithm. Currently this contains the zone number, the zone initial
    speed, and the list of fans(including their inventory path, sensor
    name, etc...).<br>
    <blockquote
cite="mid:CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Please elaborate on the mechanism planned to import it into
          code?  Y'all often use python programs to make c++, will that
          be the case here?</div>
      </div>
    </blockquote>
    Correct, that will be the case here as well.<br>
    <blockquote
cite="mid:CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Please elaborate on how the control program will execute
          it's "pluggable" algorithm?</div>
      </div>
    </blockquote>
    Filling out the associated yaml file for the control application
    defines how the algorithm will control the fan speeds based on the
    values, sensors listed, delays, etc.. that will be supported as
    parameter inputs to the algorithm.<br>
    <blockquote
cite="mid:CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Please elaborate on how the fans will be controlled?  Will
          that be as a group per system or independently per zone?</div>
      </div>
    </blockquote>
    This will be configurable by the yaml file where the fan speeds are
    set on the zone, which a zone is a group of fans. These zones can be
    constructed as 1-to-many fans enabling individual fans being
    controlled or a group of fans being controlled similarly.<br>
    <blockquote
cite="mid:CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>  -- What is a zone?</div>
      </div>
    </blockquote>
    A grouping of fans<br>
    <blockquote
cite="mid:CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Patrick</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Tue, May 2, 2017 at 11:07 AM,
          Matthew Barth <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:msbarth@linux.vnet.ibm.com" target="_blank">msbarth@linux.vnet.ibm.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Patrick,<br>
            <br>
            As Patrick mentioned a few of us have been working on the
            fan control infrastructure currently and wrote up a quick
            outline to share our thoughts on the design layout. Let us
            know if there are areas you'd like to see more detail.<br>
            <br>
            Matt<br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------8104484878CFC779E743B8AB--
