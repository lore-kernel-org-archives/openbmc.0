Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYpqL0zx6zDw2k
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 06:44:45 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uB7JUR3x120696
 for <openbmc@lists.ozlabs.org>; Wed, 7 Dec 2016 14:44:43 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 276qq038yd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 14:44:43 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 7 Dec 2016 14:44:42 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 7 Dec 2016 14:44:40 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 8AE77C9003E;
 Wed,  7 Dec 2016 14:44:23 -0500 (EST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uB7JidO33604972; Wed, 7 Dec 2016 19:44:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 194A9AC05F;
 Wed,  7 Dec 2016 14:44:40 -0500 (EST)
Received: from [9.10.99.99] (unknown [9.10.99.99])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id D6391AC043;
 Wed,  7 Dec 2016 14:44:39 -0500 (EST)
Subject: Re: Starting the phosphor-hwmon service from udev rules
To: Patrick Williams <patrick@stwcx.xyz>
References: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
 <20161129024216.GS15757@heinlein.lan>
 <accb6902-8485-6f7f-c981-4930bb911b08@linux.vnet.ibm.com>
 <20161130021902.GT15757@heinlein.lan>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Wed, 7 Dec 2016 13:44:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161130021902.GT15757@heinlein.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120719-0040-0000-0000-0000021050BC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006211; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000195; SDB=6.00790663; UDB=6.00382926; IPR=6.00568402; 
 BA=6.00004951; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013567; XFM=3.00000011;
 UTC=2016-12-07 19:44:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120719-0041-0000-0000-0000060268CD
Message-Id: <bfe482f8-3731-53f2-b73d-e99331fbac39@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-07_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612070290
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
X-List-Received-Date: Wed, 07 Dec 2016 19:44:46 -0000



On 11/29/2016 8:19 PM, Patrick Williams wrote:
> Matt,
>
> We had a phone discussion last night with Joel, Andrew J, and Brad and I
> was suppose to catch up with you today and never found time to.  (It was
> half-impromptu and half-miscommunication on the desired topic.)
>
> The net is that we came up with a third option for specifying these:
>
>     1. Unique udev rules per device with corresponding environment file, and
>        single systemd service,
>     2. Single udev rule per driver, unique systemd service file (with
>        corresponding environment file?) per device.
>
>     3. Single udev rule per driver, single template systemd service file per
>        application (ex. phosphor-hwmon@.service), unique environment file
>        per device.
>
> On Tue, Nov 29, 2016 at 10:30:12AM -0600, Matt Spinler wrote:
>
>> So now I think the rule would look something like:
>> SUBSYSTEM=="hwmon", DEVPATH=="*i2c-3/3-0077/*", ACTION == "add",
>> TAG+="systemd",
>> ENV{SYSTEMD_WANTS}+="phosphor-hwmon-3-0077@/sys/class/hwmon/%k.service"
> The 'SYSTEMD_WANTS' is useful if you want to trigger a specific
> service.  If you leave that out, by default systemd triggers a @.device,
> which other services can depend on.  sys-class-i2c-dev-i2c-3-0077.device
> maybe in this case?
>
>> and could use the Environment or EnvironmentFile directive in the
>> generated device specific unit file to pick up threshold vars.
> In obmc-console@.service we have an example of using 'BindsTo'.  I think
> we could write the phosphor-hwmon@.service to 'BindTo=sys-%i' and also
> ConditionPathExists=/etc/conf.d/phosphor-hwmon-%i ,
> EnvironmentFile=/etc/conf.d/phosphor-hwmon-%i ?
The issue with this is the %i is the device path of the hwmon driver, 
which looks like
/devices/platform/ahb/ahb:apb/1e78a000.i2c/i2c-0/i2c-0/0-0068/hwmon/hwmon0,
and the hwmon<num> can't be known ahead of time by the MRW so it can't make
conf files named that way.

This means the the environment file has to be explicitly set in the 
service file,  so I'd
need to generate unique service files.  (Or phosphor-hwmon just
builds its own env file names based on segments from its device path.)


>> Another issue I have is if the MRW should have the knowledge of if a
>> device has a hwmon driver or not?  While it would make things a lot more
>> simple if it did, I'm not sure if it's in its domain. If it doesn't,
>> then it would either still generate rules and unit files for every I2C
>> device and some just wouldn't get used, or we'd have to keep that
>> knowledge in our tree somewhere.
>> Thoughts on that?
> Doesn't it have to?  It isn't just that there is an lm77 sensor out on
> an i2c bus and therefore we create the environment file.  The
> environment file needs to have a decent amount of information, such as
> what is the "NiceName" of the sensor ("FrontAmbient" maybe).  When you
> talk about one of the MAX fan controller chips we potentially have
> multiple fans on that chip so it more than one "sensor" worth of
> configuration as well.  I can't imagine how the MRW data wouldn't
> effectively encode that we expect the device to have an hwmon driver
> (not directly, but indirectly by the presence of this information).
>
