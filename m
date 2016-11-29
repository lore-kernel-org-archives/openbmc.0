Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSptf1zx3zDvrZ
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 03:30:17 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uATGSveb088242
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 11:30:15 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 271ardagbp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 11:30:15 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 29 Nov 2016 09:30:14 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 29 Nov 2016 09:30:13 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D70D21FF002B;
 Tue, 29 Nov 2016 09:29:51 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uATGU2pF12386698; Tue, 29 Nov 2016 09:30:12 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1E6A136044;
 Tue, 29 Nov 2016 09:30:12 -0700 (MST)
Received: from [9.10.99.99] (unknown [9.10.99.99])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 5BA49136048;
 Tue, 29 Nov 2016 09:30:12 -0700 (MST)
Subject: Re: Starting the phosphor-hwmon service from udev rules
To: Patrick Williams <patrick@stwcx.xyz>
References: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
 <20161129024216.GS15757@heinlein.lan>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Tue, 29 Nov 2016 10:30:12 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <20161129024216.GS15757@heinlein.lan>
Content-Type: multipart/alternative;
 boundary="------------AEB3CD6CFC44436FCBB68063"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112916-0012-0000-0000-0000114301F2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006163; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000193; SDB=6.00786941; UDB=6.00380603; IPR=6.00564630; 
 BA=6.00004927; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013480; XFM=3.00000011;
 UTC=2016-11-29 16:30:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112916-0013-0000-0000-0000479468C5
Message-Id: <accb6902-8485-6f7f-c981-4930bb911b08@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-29_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611290276
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
X-List-Received-Date: Tue, 29 Nov 2016 16:30:18 -0000

This is a multi-part message in MIME format.
--------------AEB3CD6CFC44436FCBB68063
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/28/2016 8:42 PM, Patrick Williams wrote:
> On Mon, Nov 28, 2016 at 10:31:20AM -0600, Matt Spinler wrote:
>> The command line in the unit file would then somehow make a
>> udevadm call to pull out the ENVFILE so it can get passed into the
>> executable along with the device path.
> This was a detail I missed before.  systemd service files natively have
> the variable 'ENVFILE'.  If they don't automatically take the ENVFILE
> from the environment (via udev invocation) then I would rather we use
> unique systemd service files instead of unique udev rules.  Having the
> systemd service file launch some kind of piped shell processing is
> problematic and certainly not preferred.
>

OK. The only way for the udev rule to send something directly into the 
service file is with the template parameter, and that needs to take the 
device path, since that isn't known ahead of time.  (Unless the service 
wants to parse its %i into multiple values?)

So now I think the rule would look something like:
SUBSYSTEM=="hwmon", DEVPATH=="*i2c-3/3-0077/*", ACTION == "add", 
TAG+="systemd", 
ENV{SYSTEMD_WANTS}+="phosphor-hwmon-3-0077@/sys/class/hwmon/%k.service"

and could use the Environment or EnvironmentFile directive in the 
generated device specific unit file to pick up threshold vars.

Another issue I have is if the MRW should have the knowledge of if a 
device has a hwmon driver or not?  While it would make things a lot more 
simple if it did, I'm not sure if it's in its domain. If it doesn't, 
then it would either still generate rules and unit files for every I2C 
device and some just wouldn't get used, or we'd have to keep that 
knowledge in our tree somewhere.
Thoughts on that?


--------------AEB3CD6CFC44436FCBB68063
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/28/2016 8:42 PM, Patrick Williams
      wrote:<br>
    </div>
    <blockquote cite="mid:20161129024216.GS15757@heinlein.lan"
      type="cite">
      <pre wrap="">On Mon, Nov 28, 2016 at 10:31:20AM -0600, Matt Spinler wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">The command line in the unit file would then somehow make a 
udevadm call to pull out the ENVFILE so it can get passed into the 
executable along with the device path.
</pre>
      </blockquote>
      <pre wrap="">
This was a detail I missed before.  systemd service files natively have
the variable 'ENVFILE'.  If they don't automatically take the ENVFILE
from the environment (via udev invocation) then I would rather we use
unique systemd service files instead of unique udev rules.  Having the
systemd service file launch some kind of piped shell processing is
problematic and certainly not preferred.

</pre>
    </blockquote>
    <br>
    OK. The only way for the udev rule to send something directly into
    the service file is with the template parameter, and that needs to
    take the device path, since that isn't known ahead of time.  (Unless
    the service wants to parse its %i into multiple values?)<br>
    <br>
    So now I think the rule would look something like:<br>
    SUBSYSTEM=="hwmon", DEVPATH=="*i2c-3/3-0077/*", ACTION == "add",
    TAG+="systemd", ENV{SYSTEMD_WANTS}+=<a class="moz-txt-link-rfc2396E"
      href="mailto:phosphor-hwmon@/sys/class/hwmon/%k.service">"phosphor-hwmon-3-0077@/sys/class/hwmon/%k.service"</a><br>
    <br>
    and could use the Environment or EnvironmentFile directive in the
    generated device specific unit file to pick up threshold vars.<br>
    <br>
    Another issue I have is if the MRW should have the knowledge of if a
    device has a hwmon driver or not?  While it would make things a lot
    more simple if it did, I'm not sure if it's in its domain. If it
    doesn't, then it would either still generate rules and unit files
    for every I2C device and some just wouldn't get used, or we'd have
    to keep that knowledge in our tree somewhere.  <br>
    Thoughts on that?<br>
    <br>
  </body>
</html>

--------------AEB3CD6CFC44436FCBB68063--
