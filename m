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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zrSQM48klzF0S5
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 05:48:43 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1RIkvO9002171
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 13:48:41 -0500
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gdck78ru0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 13:48:40 -0500
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 27 Feb 2018 18:48:38 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 27 Feb 2018 18:48:36 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1RIma3G53084320; Tue, 27 Feb 2018 18:48:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 245D34C046;
 Tue, 27 Feb 2018 18:42:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CDE54C044;
 Tue, 27 Feb 2018 18:42:05 +0000 (GMT)
Received: from [9.77.211.243] (unknown [9.77.211.243])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 27 Feb 2018 18:42:05 +0000 (GMT)
Subject: Re: IPMI Sensor Read-only role updates.
To: Emily Shaffer <emilyshaffer@google.com>
References: <CACkAXSpRB4Lqhd62u+OUALeqCZpSjGD8xSPwx4yJ+WqFH7jNjA@mail.gmail.com>
 <c2cfb310-7dae-3f99-a1a3-ceac0ab9c1c8@linux.vnet.ibm.com>
 <CAJoAoZn91rnQaB0p_hsJm6Vg4KPSxYxBQH0JAgKV_-Fo-yvqXw@mail.gmail.com>
Cc: openbmc@lists.ozlabs.org
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 28 Feb 2018 00:18:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZn91rnQaB0p_hsJm6Vg4KPSxYxBQH0JAgKV_-Fo-yvqXw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------31AE414EBCECD19811DBF6D8"
X-TM-AS-GCONF: 00
x-cbid: 18022718-0020-0000-0000-000003FC845E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022718-0021-0000-0000-00004290AB82
Message-Id: <bc816428-ebaa-9c3d-b1e4-ee52c9fbbc6c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-27_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802270232
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
X-List-Received-Date: Tue, 27 Feb 2018 18:48:44 -0000

This is a multi-part message in MIME format.
--------------31AE414EBCECD19811DBF6D8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Emily,

Minor correction inline.

Regards

Ratan

On Tuesday 27 February 2018 09:06 PM, Emily Shaffer wrote:
> Hi Jayanath,
>
> Find my comments inline.
>
> It seems you may be thinking of only changes for a system specific 
> yaml, in which case I don't think you need to ask for permission :) 
> But the architecture you're discussing is already there today.
>
> Emily
>
> On Tue, Feb 27, 2018, 6:22 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com 
> <mailto:ratagupt@linux.vnet.ibm.com>> wrote:
>
>     Hi,
>
>     Please find my comments inline
>
>     Regards
>
>     Ratan Gupta
>
>
>
>     On Tuesday 27 February 2018 04:51 PM, Jayanth Othayoth wrote:
>     > I am working on an issue openbmc/openbmc#2500 (Add support for Turbo
>     > allowed sensor). As part of this issue implementation , there is a
>     > requirement  to change this IPMI sensor to read only for host.
>     > Currently all sensors are read/write by design and doesn’t have
>     way to
>     > change this behavior. Planing to change this behavior by adding
>     > “Mutability” field in the config.yaml.
>
> ES: The Mutability field already exists in sensor config yaml. 
> https://github.com/openbmc/phosphor-host-ipmid/blob/2e12a31f39d95c381a466e277e510faa02c351fb/scripts/writesensor.mako.cpp#L68
     RG>> Here in mako we always set the mutability property to READ as 
config YAML doesn't have the Mutability property.
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory-mrw-config/config.yaml

     RG>>We have the Mutability check in the getSensorReading but we 
don't have that check in the setSensorReading so we can introduce that 
check there with the required changes in the config.YAML.

>     >
>     > As part of this issue am planing to  Initialize mutability with
>     > Mutability::Write|Mutability::Read for all sensors and set the
>     > required sensor mutability Mutability::Read.
>
> ES: You're saying you'd like to ensure all sensors are readable? This 
> doesn't make sense in some cases, notably fan PWM in some cases where 
> the only read response would be DBus parroting back what we wrote (not 
> an actual value reflecting reality).
>
>     >       - Minimal impact on testing and not breaking the existing
>     > functionality.
>     RG>>How we would be doing it? If we are planning to do introduce a
>     check
>     for a specific sensor then we should not do like this.
>     In the current design we have not introduced any such checks and we
>     should avoid that.
>     Please correct me if I misunderstood it.
>
   RG>>if we add the Mutability property in the config.yaml with 
configured values as READ and WRITE for all other sensor
             Except this one(turboAllowedSensor) which is required to be 
READ
             In this sense we are not breaking the current code as the 
interpretation in the code for all the sensor is READ and WRITE
>
>     >
>     > Follow-on story is needed to fix this in generic way like
>     >   -Add “mutable” field in the config.yaml and initialize the the
>     field
>
> ES: Today it's defaulted to read-only for all uninitialized sensors.
>
>     > based on System types also update
>     > sensorhandler.cpp->ipmi_sen_set_sensor() to do set only for write
>     > enabled sensor.
>     >     - This required system specific IPMI sensor behavior review and
>     > updates in corresponding config.yaml.
>     RG>> I agree with this approach.What do you mean by "System types"
>     here,We have already system specfic YAML in the system specfic
>     meta layers.
>
>     >
>     > Please add your view on this.
>


--------------31AE414EBCECD19811DBF6D8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hi Emily,</p>
    <p>Minor correction inline.</p>
    <p>Regards</p>
    <p>Ratan <br>
    </p>
    <div class="moz-cite-prefix">On Tuesday 27 February 2018 09:06 PM,
      Emily Shaffer wrote:<br>
    </div>
    <blockquote
cite="mid:CAJoAoZn91rnQaB0p_hsJm6Vg4KPSxYxBQH0JAgKV_-Fo-yvqXw@mail.gmail.com"
      type="cite">Hi Jayanath,
      <div><br>
      </div>
      <div>Find my comments inline.</div>
      <div><br>
      </div>
      <div>It seems you may be thinking of only changes for a system
        specific yaml, in which case I don't think you need to ask for
        permission :) But the architecture you're discussing is already
        there today.</div>
      <div><br>
      </div>
      <div>Emily</div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr">On Tue, Feb 27, 2018, 6:22 AM Ratan Gupta &lt;<a
              moz-do-not-send="true"
              href="mailto:ratagupt@linux.vnet.ibm.com"><a class="moz-txt-link-abbreviated" href="mailto:ratagupt@linux.vnet.ibm.com">ratagupt@linux.vnet.ibm.com</a></a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
            <br>
            Please find my comments inline<br>
            <br>
            Regards<br>
            <br>
            Ratan Gupta<br>
            <br>
            <br>
            <br>
            On Tuesday 27 February 2018 04:51 PM, Jayanth Othayoth
            wrote:<br>
            &gt; I am working on an issue openbmc/openbmc#2500 (Add
            support for Turbo<br>
            &gt; allowed sensor). As part of this issue implementation ,
            there is a<br>
            &gt; requirement  to change this IPMI sensor to read only
            for host.<br>
            &gt; Currently all sensors are read/write by design and
            doesn’t have way to<br>
            &gt; change this behavior. Planing to change this behavior
            by adding<br>
            &gt; “Mutability” field in the config.yaml.<br>
          </blockquote>
        </div>
        <div>ES: The Mutability field already exists in sensor config
          yaml. <a moz-do-not-send="true"
href="https://github.com/openbmc/phosphor-host-ipmid/blob/2e12a31f39d95c381a466e277e510faa02c351fb/scripts/writesensor.mako.cpp#L68">https://github.com/openbmc/phosphor-host-ipmid/blob/2e12a31f39d95c381a466e277e510faa02c351fb/scripts/writesensor.mako.cpp#L68</a></div>
      </div>
    </blockquote>
        RG&gt;&gt; Here in mako we always set the mutability property to
    READ as config YAML doesn't have the Mutability property.<br>
       
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory-mrw-config/config.yaml">https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory-mrw-config/config.yaml</a><br>
    <br>
        RG&gt;&gt;We have the Mutability check in the getSensorReading
    but we don't have that check in the setSensorReading so we can
    introduce that check there with the required changes in the
    config.YAML.    <br>
       <br>
    <blockquote
cite="mid:CAJoAoZn91rnQaB0p_hsJm6Vg4KPSxYxBQH0JAgKV_-Fo-yvqXw@mail.gmail.com"
      type="cite">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            &gt;<br>
            &gt; As part of this issue am planing to  Initialize 
            mutability with<br>
            &gt; Mutability::Write|Mutability::Read for all sensors and
            set the<br>
            &gt; required sensor mutability Mutability::Read.<br>
          </blockquote>
        </div>
        <div dir="auto">ES: You're saying you'd like to ensure all
          sensors are readable? This doesn't make sense in some cases,
          notably fan PWM in some cases where the only read response
          would be DBus parroting back what we wrote (not an actual
          value reflecting reality).</div>
        <div class="gmail_quote" dir="auto">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            &gt;       - Minimal impact on testing and not breaking the
            existing<br>
            &gt; functionality.<br>
            RG&gt;&gt;How we would be doing it? If we are planning to do
            introduce a check<br>
            for a specific sensor then we should not do like this.<br>
            In the current design we have not introduced any such checks
            and we<br>
            should avoid that.<br>
            Please correct me if I misunderstood it.<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
      RG&gt;&gt;if we add the Mutability property in the config.yaml
    with configured values as READ and WRITE for all other sensor<br>
                Except this one(turboAllowedSensor) which is required to
    be READ<br>
                In this sense we are not breaking the current code as
    the interpretation in the code for all the sensor is READ and WRITE<br>
    <blockquote
cite="mid:CAJoAoZn91rnQaB0p_hsJm6Vg4KPSxYxBQH0JAgKV_-Fo-yvqXw@mail.gmail.com"
      type="cite">
      <div>
        <div class="gmail_quote" dir="auto">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            &gt;<br>
            &gt; Follow-on story is needed to fix this in generic way
            like<br>
            &gt;   -Add “mutable” field in the config.yaml and
            initialize the the field<br>
          </blockquote>
        </div>
        <div dir="auto">ES: Today it's defaulted to read-only for all
          uninitialized sensors.</div>
        <div class="gmail_quote" dir="auto">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            &gt; based on System types also update<br>
            &gt; sensorhandler.cpp-&gt;ipmi_sen_set_sensor() to do set
            only for write<br>
            &gt; enabled sensor.<br>
            &gt;     - This required system specific IPMI sensor
            behavior review and<br>
            &gt; updates in corresponding config.yaml.<br>
            RG&gt;&gt; I agree with this approach.What do you mean by
            "System types"<br>
            here,We have already system specfic YAML in the system
            specfic meta layers.<br>
            <br>
            &gt;<br>
            &gt; Please add your view on this.<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------31AE414EBCECD19811DBF6D8--
