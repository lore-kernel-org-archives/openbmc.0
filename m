Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJ0LM6HXKzDqBH
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 00:05:47 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v43E4kLB060623
 for <openbmc@lists.ozlabs.org>; Wed, 3 May 2017 10:05:42 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a7g25hxpf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 May 2017 10:05:38 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Wed, 3 May 2017 08:05:23 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 3 May 2017 08:05:14 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v43E52pm16384404; Wed, 3 May 2017 07:05:10 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF794BE053;
 Wed,  3 May 2017 08:05:10 -0600 (MDT)
Received: from [9.10.99.146] (unknown [9.10.99.146])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 8B7DEBE05D;
 Wed,  3 May 2017 08:05:10 -0600 (MDT)
Subject: Re: OpenBMC Thermal Design
To: Patrick Venture <venture@google.com>
References: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
 <20170418023159.GA25774@heinlein.lan>
 <CAO=notww5QJUuMpc8qYxey+AH4mvi6eb+VXs=dqzvAyP9P1y0Q@mail.gmail.com>
 <290c826d-da59-2bed-ecee-7aa1f778ab71@linux.vnet.ibm.com>
 <CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com>
 <4f971554-1f33-c7ab-c0b5-3105c3505083@linux.vnet.ibm.com>
 <CAO=notyO9vNR-QcbUFMHhdw+EB64k0x-fM4ycwxF7G_Ck_xUiA@mail.gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
Date: Wed, 3 May 2017 09:05:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAO=notyO9vNR-QcbUFMHhdw+EB64k0x-fM4ycwxF7G_Ck_xUiA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------71A39FA6EFC0123BCBA762A4"
X-TM-AS-GCONF: 00
x-cbid: 17050314-0012-0000-0000-00001429C1C2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007017; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00855684; UDB=6.00423515; IPR=6.00634846; 
 BA=6.00005323; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015283; XFM=3.00000014;
 UTC=2017-05-03 14:05:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050314-0013-0000-0000-00004D77DA3C
Message-Id: <5d4566bf-6499-99b1-15b0-f156600dad35@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-03_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705030262
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
X-List-Received-Date: Wed, 03 May 2017 14:05:48 -0000

This is a multi-part message in MIME format.
--------------71A39FA6EFC0123BCBA762A4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/17 4:33 PM, Patrick Venture wrote:
> Fantastic!  Thanks for elaborating.
>
> >> Please elaborate on how the control program will execute it's 
> "pluggable" algorithm?
> > Filling out the associated yaml file for the control application 
> defines how the algorithm will control the fan speeds based on the 
> values, sensors listed, delays, etc.. that will be supported as 
> parameter inputs to the algorithm.
>
> What do you mean by "delays?"
>
No prob, so in our design each temperature sensor that's an input to the 
control algorithm has a defined RPM delta for each degree above or below 
a defined "nominal" temperature range. For each sensor read, the maximum 
RPM delta based on their reported temps are written as the new speed 
target for the zone they are included in. After that occurs, any more 
RPM deltas determined from the sensor readings are ignored for a set 
amount of time(delay), unless the RPM delta is larger than the previous 
RPM change. If that happens, the difference in RPM deltas is then 
written as the new speed target for the zone they are included in again.

Not sure if that describes it well enough, but for example:
Given a core temp's "nominal" temperature range is 75-78C, if that core 
reports a temp of 79C with a defined RPM increase delta of 300rpms per 
degree above, then the fans in the zone containing this core are 
increased 300rpms. After that increase is requested, no increase 
requests 300rpm and less are done until after the delay interval has 
passed. Whereas if another core is reported at 80C, resulting in a 
600rpm increase request during that delay interval, then an additional 
300rpms are added to the previous target and the delay interval 
restarts. After the interval expires it considers all incoming deltas again.

The delay interval is there to help eliminate unnecessary speed change 
requests while the fans are going to their target speed. Also, this 
minimizes the possibility for speed oscillations.

Matt
>
> Patrick
>
>
> On Tue, May 2, 2017 at 2:21 PM, Matthew Barth 
> <msbarth@linux.vnet.ibm.com <mailto:msbarth@linux.vnet.ibm.com>> wrote:
>
>     On 05/02/17 2:33 PM, Patrick Venture wrote:
>>     Please elaborate on the format or layout of the control
>>     configuration file.
>     This will be a yaml file containing the zone and fan definitions
>     with the associated set of parameters that feed into the control
>     algorithm. Currently this contains the zone number, the zone
>     initial speed, and the list of fans(including their inventory
>     path, sensor name, etc...).
>>     Please elaborate on the mechanism planned to import it into
>>     code?  Y'all often use python programs to make c++, will that be
>>     the case here?
>     Correct, that will be the case here as well.
>>     Please elaborate on how the control program will execute it's
>>     "pluggable" algorithm?
>     Filling out the associated yaml file for the control application
>     defines how the algorithm will control the fan speeds based on the
>     values, sensors listed, delays, etc.. that will be supported as
>     parameter inputs to the algorithm.
>>     Please elaborate on how the fans will be controlled?  Will that
>>     be as a group per system or independently per zone?
>     This will be configurable by the yaml file where the fan speeds
>     are set on the zone, which a zone is a group of fans. These zones
>     can be constructed as 1-to-many fans enabling individual fans
>     being controlled or a group of fans being controlled similarly.
>>       -- What is a zone?
>     A grouping of fans
>>
>>     Patrick
>>
>>     On Tue, May 2, 2017 at 11:07 AM, Matthew Barth
>>     <msbarth@linux.vnet.ibm.com <mailto:msbarth@linux.vnet.ibm.com>>
>>     wrote:
>>
>>         Patrick,
>>
>>         As Patrick mentioned a few of us have been working on the fan
>>         control infrastructure currently and wrote up a quick outline
>>         to share our thoughts on the design layout. Let us know if
>>         there are areas you'd like to see more detail.
>>
>>         Matt
>>
>>
>
>


--------------71A39FA6EFC0123BCBA762A4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 05/02/17 4:33 PM, Patrick Venture wrote:<br>
    <blockquote
cite="mid:CAO=notyO9vNR-QcbUFMHhdw+EB64k0x-fM4ycwxF7G_Ck_xUiA@mail.gmail.com"
      type="cite">
      <div dir="ltr">Fantastic!  Thanks for elaborating.
        <div>
          <table class="gmail-Bs gmail-nH gmail-iY" style="width:1363px"
            cellpadding="0">
            <tbody>
              <tr>
                <td class="gmail-Bu"><br>
                  &gt;&gt; Please elaborate on how the control program
                  will execute it's "pluggable" algorithm?<br>
                  &gt; Filling out the associated yaml file for the
                  control application defines how the algorithm will
                  control the fan speeds based on the values, sensors
                  listed, delays, etc.. that will be supported as
                  parameter inputs to the algorithm.<br>
                  <br>
                  What do you mean by "delays?"<br>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </blockquote>
    No prob, so in our design each temperature sensor that's an input to
    the control algorithm has a defined RPM delta for each degree above
    or below a defined "nominal" temperature range. For each sensor
    read, the maximum RPM delta based on their reported temps are
    written as the new speed target for the zone they are included in.
    After that occurs, any more RPM deltas determined from the sensor
    readings are ignored for a set amount of time(delay), unless the RPM
    delta is larger than the previous RPM change. If that happens, the
    difference in RPM deltas is then written as the new speed target for
    the zone they are included in again.<br>
    <br>
    Not sure if that describes it well enough, but for example:<br>
    Given a core temp's "nominal" temperature range is 75-78C, if that
    core reports a temp of 79C with a defined RPM increase delta of
    300rpms per degree above, then the fans in the zone containing this
    core are increased 300rpms. After that increase is requested, no
    increase requests 300rpm and less are done until after the delay
    interval has passed. Whereas if another core is reported at 80C,
    resulting in a 600rpm increase request during that delay interval,
    then an additional 300rpms are added to the previous target and the
    delay interval restarts. After the interval expires it considers all
    incoming deltas again.<br>
    <br>
    The delay interval is there to help eliminate unnecessary speed
    change requests while the fans are going to their target speed.
    Also, this minimizes the possibility for speed oscillations.<br>
    <br>
    Matt<br>
    <blockquote
cite="mid:CAO=notyO9vNR-QcbUFMHhdw+EB64k0x-fM4ycwxF7G_Ck_xUiA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <table class="gmail-Bs gmail-nH gmail-iY" style="width:1363px"
            cellpadding="0">
            <tbody>
              <tr>
                <td class="gmail-Bu"><br>
                  Patrick</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Tue, May 2, 2017 at 2:21 PM, Matthew
          Barth <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:msbarth@linux.vnet.ibm.com" target="_blank">msbarth@linux.vnet.ibm.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div bgcolor="#FFFFFF" text="#000000"><span class=""> On
                05/02/17 2:33 PM, Patrick Venture wrote:<br>
                <blockquote type="cite">
                  <div dir="ltr">Please elaborate on the format or
                    layout of the control configuration file.</div>
                </blockquote>
              </span> This will be a yaml file containing the zone and
              fan definitions with the associated set of parameters that
              feed into the control algorithm. Currently this contains
              the zone number, the zone initial speed, and the list of
              fans(including their inventory path, sensor name, etc...).<span
                class=""><br>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div>Please elaborate on the mechanism planned to
                      import it into code?  Y'all often use python
                      programs to make c++, will that be the case here?</div>
                  </div>
                </blockquote>
              </span> Correct, that will be the case here as well.<span
                class=""><br>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div>Please elaborate on how the control program
                      will execute it's "pluggable" algorithm?</div>
                  </div>
                </blockquote>
              </span> Filling out the associated yaml file for the
              control application defines how the algorithm will control
              the fan speeds based on the values, sensors listed,
              delays, etc.. that will be supported as parameter inputs
              to the algorithm.<span class=""><br>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div>Please elaborate on how the fans will be
                      controlled?  Will that be as a group per system or
                      independently per zone?</div>
                  </div>
                </blockquote>
              </span> This will be configurable by the yaml file where
              the fan speeds are set on the zone, which a zone is a
              group of fans. These zones can be constructed as 1-to-many
              fans enabling individual fans being controlled or a group
              of fans being controlled similarly.<span class=""><br>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div>  -- What is a zone?</div>
                  </div>
                </blockquote>
              </span> A grouping of fans<span class=""><br>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div><br>
                    </div>
                    <div>Patrick</div>
                  </div>
                  <div class="gmail_extra"><br>
                    <div class="gmail_quote">On Tue, May 2, 2017 at
                      11:07 AM, Matthew Barth <span dir="ltr">&lt;<a
                          moz-do-not-send="true"
                          href="mailto:msbarth@linux.vnet.ibm.com"
                          target="_blank">msbarth@linux.vnet.ibm.com</a>&gt;</span>
                      wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">Patrick,<br>
                        <br>
                        As Patrick mentioned a few of us have been
                        working on the fan control infrastructure
                        currently and wrote up a quick outline to share
                        our thoughts on the design layout. Let us know
                        if there are areas you'd like to see more
                        detail.<br>
                        <br>
                        Matt<br>
                      </blockquote>
                    </div>
                    <br>
                  </div>
                </blockquote>
                <br>
              </span></div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------71A39FA6EFC0123BCBA762A4--
