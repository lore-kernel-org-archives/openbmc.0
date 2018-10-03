Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42QSdx6ZTkzF38J
 for <openbmc@lists.ozlabs.org>; Thu,  4 Oct 2018 06:43:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w93KdGEF031256
 for <openbmc@lists.ozlabs.org>; Wed, 3 Oct 2018 16:43:15 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2mw37s4ra6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Oct 2018 16:43:15 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 3 Oct 2018 14:43:14 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Oct 2018 14:43:11 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w93KhAAC25165996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Oct 2018 13:43:10 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 370BF6E056;
 Wed,  3 Oct 2018 14:43:10 -0600 (MDT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 601BC6E050;
 Wed,  3 Oct 2018 14:43:09 -0600 (MDT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  3 Oct 2018 14:43:09 -0600 (MDT)
Subject: Re: [PATCH v3 2/2] media: platform: Add Aspeed Video Engine driver
To: Hans Verkuil <hverkuil@xs4all.nl>, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mchehab@kernel.org,
 linux-media@vger.kernel.org
References: <1537903629-14003-1-git-send-email-eajames@linux.ibm.com>
 <1537903629-14003-3-git-send-email-eajames@linux.ibm.com>
 <a78d4c7a-ac58-c23d-a683-23dce54be993@xs4all.nl>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 3 Oct 2018 15:43:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a78d4c7a-ac58-c23d-a683-23dce54be993@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18100320-8235-0000-0000-00000E0C2523
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009816; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000267; SDB=6.01097423; UDB=6.00567539; IPR=6.00877466; 
 MB=3.00023602; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-03 20:43:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18100320-8236-0000-0000-000042DD39A1
Message-Id: <ca4757b9-0825-bbbf-b388-0295fd13bad7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810030191
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
X-List-Received-Date: Wed, 03 Oct 2018 20:43:18 -0000



On 09/28/2018 06:30 AM, Hans Verkuil wrote:
> On 09/25/2018 09:27 PM, Eddie James wrote:
>> The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs
>> can capture and compress video data from digital or analog sources. With
>> the Aspeed chip acting a service processor, the Video Engine can capture
>> the host processor graphics output.
>>
>> Add a V4L2 driver to capture video data and compress it to JPEG images.
>> Make the video frames available through the V4L2 streaming interface.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>

>> +	}
>> +
>> +	video->height = (bottom - top) + 1;
>> +	video->width = (right - left) + 1;
>> +	size = video->height * video->width;
> It looks like you can actually determine the blanking width/height and
> possibly even more detailed information that would be very useful to
> show with the DV_TIMINGS ioctls.

Hmm. This information is related to the video signal captured from the 
host. That information has nothing to do with the buffer that is 
compressed and grabbed by the driver and ultimately provided to 
userspace. Isn't the timing information meaningless for JPEG frames?

Forgot to include this question in my previous reply, sorry for the 
additional mail.

Thanks,
Eddie

>
>> +
>> +	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>> +	if (size < DIRECT_FETCH_THRESHOLD) {
>> +		aspeed_video_write(video, VE_TGS_0,
>> +				   FIELD_PREP(VE_TGS_FIRST, left - 1) |
>> +				   FIELD_PREP(VE_TGS_LAST, right));
>> +		aspeed_video_write(video, VE_TGS_1,
>> +				   FIELD_PREP(VE_TGS_FIRST, top) |
>>
