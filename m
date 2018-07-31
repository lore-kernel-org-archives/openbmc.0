Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fzVk42HRzF18B
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 00:35:09 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6VE8uXZ101243
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 10:35:07 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kjs50smte-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 10:35:07 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 31 Jul 2018 10:35:06 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Jul 2018 10:35:04 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6VEZ3HB10879360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 31 Jul 2018 14:35:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E142A2805A;
 Tue, 31 Jul 2018 10:34:01 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10C242805E;
 Tue, 31 Jul 2018 10:34:00 -0400 (EDT)
Received: from oc6728276242.ibm.com (unknown [9.85.200.240])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 31 Jul 2018 10:33:59 -0400 (EDT)
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8miBLVk0gU3VwcG9ydD8=?=
To: xiuzhi <1450335857@qq.com>, "Alexander A. Filippov" <a.filippov@yadro.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_7C15837BAB91A131A31142D54EE9723ED405@qq.com>
 <20180725085640.GA10849@bbwork.lan>
 <tencent_E51A85548B940EE6A95D61B89D1B8D1ACF09@qq.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 31 Jul 2018 09:35:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <tencent_E51A85548B940EE6A95D61B89D1B8D1ACF09@qq.com>
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18073114-0068-0000-0000-000003209133
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009463; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01068480; UDB=6.00549297; IPR=6.00846678; 
 MB=3.00022427; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-31 14:35:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18073114-0069-0000-0000-000045390070
Message-Id: <5dababc2-4245-46fd-3989-c8a97d064e24@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-31_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807310137
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
X-List-Received-Date: Tue, 31 Jul 2018 14:35:11 -0000



On 07/31/2018 01:52 AM, xiuzhi wrote:
> Hi Alexander ,Eddie,
>   I merged the source from 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11500/,and 
> kernel branch video-dev.
> How to test the video kvm feature by phosphor-webui or command line?

Hi,

You need to make sure the video device is enabled in your device-tree 
for the machine you use... My kernel patch enabled it for our AST2500 
witherspoon system. If you're using AST2500 as well, then you just need 
something like:

&video {
     status = "okay";
     memory-region = <&gfx_memory>;
};

And the virtual USB hub:
&vhub {
     status = "okay";
};

If you're not using AST2500, you'll need more changes to device-tree.

Then on the BMC command line:
create_usbhid.sh
obmc-ikvm -v /dev/video0 -i /dev/hidg0
And connect with any VNC client to port 0 of your BMC IP.

Thanks,
Eddie

> Best,
> xiuzhi
>
>
> ------------------ 原始邮件 ------------------
> *发件人:* "Alexander A. Filippov"<a.filippov@yadro.com>;
> *发送时间:* 2018年7月25日(星期三) 下午4:56
> *收件人:* "openbmc"<openbmc@lists.ozlabs.org>;"xiuzhi"<1450335857@qq.com>;
> *主题:* Re: KVM Support?
>
> Hello everybody,
>
> Could you check the size of 
> `build/tmp/deploy/image/<platformname>/fitImage-openbmc-phosphor-initramfs-*.bin`?
> If it exceeds 4456448 (0x440000) bytes, this is the problem described 
> at https://github.com/openbmc/openbmc/issues/3314
>
>
> In this case you should modify flash partitions layout or trying to 
> decrease kernel size.
>
> --
> Alexander
>
> On Wed, Jul 25, 2018 at 03:48:04PM +0800, xiuzhi wrote:
> > Hi Eddie,
> >
> >
> >   I read your KVM Support email on mailinglist.
> >
> >
> > I am going to port the BMC kvm to ast2400 . The u-boot can not load 
> kernel ,the error message read:
> >
> >
> > ""U-Boot 2016.07 (Jul 23 2018 - 11:11:50 +0000)
> >
> >
> > DRAM:  240 MiB
> > WARNING: Caches not enabled
> > Flash: 32 MiB
> > *** Warning - bad CRC, using default environment
> >
> >
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Net:   aspeednic#0
> > Error: aspeednic#0 address not set.
> >
> >
> > Hit any key to stop autoboot:  0
> > ## Loading kernel from FIT Image at 20080000 ...
> > Bad FIT kernel image format!
> > ERROR: can't get kernel image!
> > ast#
> >
> >
> > I added  config options to defconfig of ast2400 as follows:
> >
> >
> > CONFIG_MEDIA_SUPPORT=y
> > CONFIG_MEDIA_CAMERA_SUPPORT=y
> > CONFIG_MEDIA_SUPPORT=y
> > CONFIG_MEDIA_CAMERA_SUPPORT=y
> > # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> > # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> > # CONFIG_MEDIA_RADIO_SUPPORT is not set
> > # CONFIG_MEDIA_SDR_SUPPORT is not set
> > # CONFIG_MEDIA_CEC_SUPPORT is not set
> > # CONFIG_MEDIA_CONTROLLER is not set
> > CONFIG_RATIONAL=y
> > CONFIG_VIDEO_DEV=y
> > CONFIG_VIDEO_V4L2=y
> > CONFIG_V4L_PLATFORM_DRIVERS=y
> > CONFIG_VIDEO_ASPEED=y
> > CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
> >
> >
> > Need I modify the aspeed-bmc-opp-palmetto.dts and aspeed-g4.dtsi?
> >
> >
> > Can you give me the file list need to modify?
> >
> >
> > Thanks,
> >
> >
> > xiuzhi
