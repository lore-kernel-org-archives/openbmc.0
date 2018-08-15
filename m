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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41r8pc518bzF1RN
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 23:05:43 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7FD470q016904
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 09:05:41 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kvkcrujwv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 09:05:41 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 15 Aug 2018 09:05:39 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 15 Aug 2018 09:05:37 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7FD5am14457012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Aug 2018 13:05:36 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE9A8AE062;
 Wed, 15 Aug 2018 09:05:23 -0400 (EDT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 724B8AE05F;
 Wed, 15 Aug 2018 09:05:23 -0400 (EDT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 15 Aug 2018 09:05:23 -0400 (EDT)
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8miDlm57lpI3vvJog5Zue5aSN77yaIOWbnuWkjQ==?=
 =?UTF-8?Q?=ef=bc=9a_KVM_Support=3f?=
To: xiuzhi <1450335857@qq.com>, "Alexander A. Filippov" <a.filippov@yadro.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 15 Aug 2018 08:05:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18081513-0072-0000-0000-0000039175E6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009548; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01073869; UDB=6.00553354; IPR=6.00853828; 
 MB=3.00022734; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-15 13:05:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081513-0073-0000-0000-00004915EE39
Message-Id: <004c4dee-ada1-61f8-6c6c-653be2b3e57f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-15_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808150142
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
X-List-Received-Date: Wed, 15 Aug 2018 13:05:46 -0000



On 08/14/2018 01:39 AM, xiuzhi wrote:
> Hi Eddie,
>    The video-dev2 can work on AST2400, the tightvnc  connect to BMC 
> vncserver stably when the host cpu run centos GUI.
> Two issues was found in testing process .
> 1, The obmc-ikvm will stop connection when host server window flush 
> from one to next  on BIOS or kernel booting process.
> The error log on AST2400 is :
> 18/07/2018 13:37:32 Listening for VNC connections on TCP port 5900
> 18/07/2018 13:37:32 Listening for VNC connections on TCP6 port 5900
> [11704.151172] aspeed-video 1e700000.video: resolution changed; resetting
> [11704.888188] aspeed-video 1e700000.video: resolution changed; resetting
> [11705.613868] aspeed-video 1e700000.video: invalid resolution detected
> [11705.620421] aspeed-video 1e700000.video: resolution changed; 
> couldn't get new resolution

OK, I noticed a similar issue on AST2500 when immediately detecting 
resolution after mode change. I added a delay, but it probably needs to 
be longer on AST2400... Also, most client's don't handle server-side 
resize, so usually the window will close and you'll have to re-open 
anyway I think, if the size is changing.

Thanks,
Eddie

>
>
> 2, The VNC Viewer can not connect to bmc server.
> The error on VNC Viewer client is :
> "   Attempting to reconnect to VNC Server ...
>    RFB protocol error:unknown rect encoding 7
> "
>
> The error log  on BMC is :
> 18/07/2018 14:03:18 Got connection from client 192.168.120.58
> 18/07/2018 14:03:18   other clients:
> 18/07/2018 14:03:18 Normal socket connection
> 18/07/2018 14:03:18 Client Protocol Version 3.8
> 18/07/2018 14:03:18 Protocol version sent 3.8, using 3.8
> 18/07/2018 14:03:18 rfbProcessClientSecurityType: executing handler 
> for type 1
> 18/07/2018 14:03:18 rfbProcessClientSecurityType: returning 
> securityResult for client rfb version >= 3.8
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000018)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000016)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000015)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x0000000F)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0xFFFFFEC6)
> 18/07/2018 14:03:18 Enabling full-color cursor updates for client 
> 192.168.120.58
> 18/07/2018 14:03:18 Enabling NewFBSize protocol extension for client 
> 192.168.120.58
> 18/07/2018 14:03:18 Using ZRLE encoding for client 192.168.120.58
> 18/07/2018 14:03:18 Pixel format for client 192.168.120.58:
> 18/07/2018 14:03:18   8 bpp, depth 6
> 18/07/2018 14:03:18   true colour: max r 3 g 3 b 3, shift r 4 g 2 b 0
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000018)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000016)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000015)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x0000000F)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0xFFFFFEC6)
> 18/07/2018 14:03:18 Enabling full-color cursor updates for client 
> 192.168.120.58
> 18/07/2018 14:03:18 Enabling NewFBSize protocol extension for client 
> 192.168.120.58
> 18/07/2018 14:03:18 Switching from ZRLE to raw Encoding for client 
> 192.168.120.58
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000018)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000016)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x00000015)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0x0000000F)
> 18/07/2018 14:03:18 rfbProcessClientNormalMessage: ignoring 
> unsupported encoding type Enc(0xFFFFFEC6)
> 18/07/2018 14:03:18 Enabling full-color cursor updates for client 
> 192.168.120.58
> 18/07/2018 14:03:18 Enabling NewFBSize protocol extension for client 
> 192.168.120.58
> 18/07/2018 14:03:18 Switching from raw to ZRLE Encoding for client 
> 192.168.120.58
> 18/07/2018 14:03:18 Pixel format for client 192.168.120.58:
> 18/07/2018 14:03:18   32 bpp, depth 24, little endian
> 18/07/2018 14:03:18   true colour: max r 255 g 255 b 255, shift r 16 g 
> 8 b 0
> 18/07/2018 14:03:19 rfbProcessClientNormalMessage: read: Connection 
> reset by peer
> 18/07/2018 14:03:19 Client 192.168.120.58 gone
> 18/07/2018 14:03:19 Statistics             events Transmit/ RawEquiv ( 
> saved)
> 18/07/2018 14:03:19  FramebufferUpdate   :      3 |  0/        0 (  0.0%)
> 18/07/2018 14:03:19  tight               :      1 |  33807/  3145740 ( 
> 98.9%)
> 18/07/2018 14:03:19  raw                 :      1 |  16396/    16396 
> (  0.0%)
> 18/07/2018 14:03:19  ZRLE                :      2 | 62/  3932160 (100.0%)
> 18/07/2018 14:03:19  RichCursor          :      3 |  429/      429 (  
> 0.0%)
> 18/07/2018 14:03:19  TOTALS              :     10 |  50694/  7094725 ( 
> 99.3%)
> 18/07/2018 14:03:19 Statistics             events Received/ RawEquiv ( 
> saved)
> 18/07/2018 14:03:19  FramebufferUpdate   :      4 | 40/       40 (  0.0%)
> 18/07/2018 14:03:19  SetPixelFormat      :      2 | 40/       40 (  0.0%)
> 18/07/2018 14:03:19  SetEncodings        :      3 |  168/      168 (  
> 0.0%)
> 18/07/2018 14:03:19  TOTALS              :      9 |  248/      248 (  
> 0.0%)
>
> Best,
> Xiuzhi
> Hi Eddie,
>    Very good work!
>   The video-dev2 works on AST2400 now, I will do more test.
> Thanks,
> Xiuzhi
> On 08/10/2018 10:00 AM, Eddie James wrote:
> >
> >
> > On 08/10/2018 06:14 AM, xiuzhi wrote:
> >> Hi Eddie,
> >>    I tested the new update source of video-dev on AST2400 and
> >> AST2500. It works on AST2500.
> >>  On AST2400，the vncviewer can connect vncserver sucessful, but its
> >> window was blank,  not shown any information of the host screen .
> >> Would you like to give me some advice or instruments on how to  debug
> >> this issue?
>
> Hey, I also just pushed a new branch to my github with some
> simplifications to the driver... It no longer uses the auto mode and may
> work better on AST2400... I don't have any AST2400 to test on, but let
> me know if you have any luck:
>
> https://github.com/eddiejames/linux/commits/video-dev2
>
> Thanks,
> Eddie
>
> >
> > Hi,
> >
> > You could try enabling the debug tracing, if dynamic debug is enabled
> > on your kernel. (CONFIG_DYNAMIC_DEBUG)
> >
> > echo file aspeed-video.c +p > /sys/kernel/debug/dynamic_debug/control
> >
> > That should print every register access, as well as some other info.
> >
> > Thanks,
> > Eddie
> >
> >> Hi,
> >>
> >> There are some differences with the video engine between the 
> AST2400 and
> >> AST2500 that I haven't addressed yet, so probably the driver is not
> >> working correctly on the AST2400 yet. Some registers have different bit
> >> mapping, and things like that. Sorry about that... thanks for trying it
> >> out! I'll look at the changes needed for AST2400 next.
> >>
> >> Thanks,
> >>
> >> Eddie
> >>
> >>
> >> On 08/01/2018 03:47 AM, xiuzhi wrote:
> >> > Hi Eddie,
> >> >   Now It works, but the vncviewer can not connect the BMC server
> >> > successful.
> >> > When I use vncviewer connect to the BMC the error read:
> >> > "RFB protocol error: bad desktop size 0x1"
> >> > "RFB protocol error: unknow rect encoding 7"
> >> > The information on BMC are :
> >> > root@zhaoxinc:~# obmc-ikvm -v /dev/video0 -i /dev/hidg0
> >> > frame buffer size: 3145728
> >> > 19/07/2018 08:20:57 Listening for VNC connections on TCP port 5900
> >> > 19/07/2018 08:20:57 Listening for VNC connections on TCP6 port 5900
> >> >
> >> > 19/07/2018 08:52:08 Got connection from client 192.168.120.58
> >> > 19/07/2018 08:52:08   other clients:
> >> > 19/07/2018 08:52:08 Normal socket connection
> >> > 19/07/2018 08:52:08 Client Protocol Version 3.8
> >> > 19/07/2018 08:52:08 Protocol version sent 3.8, using 3.8
> >> > 19/07/2018 08:52:08 rfbProcessClientSecurityType: executing handler
> >> > for type 1
> >> > 19/07/2018 08:52:08 rfbProcessClientSecurityType: returning
> >> > securityResult for client rfb version >= 3.8
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000018)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000016)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000015)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x0000000F)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0xFFFFFEC6)
> >> > 19/07/2018 08:52:08 Enabling full-color cursor updates for client
> >> > 192.168.120.58
> >> > 19/07/2018 08:52:08 Enabling NewFBSize protocol extension for client
> >> > 192.168.120.58
> >> > 19/07/2018 08:52:08 Using ZRLE encoding for client 192.168.120.58
> >> > 19/07/2018 08:52:08 Pixel format for client 192.168.120.58:
> >> > 19/07/2018 08:52:08   8 bpp, depth 6
> >> > 19/07/2018 08:52:08   true colour: max r 3 g 3 b 3, shift r 4 g 2 b 0
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000018)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000016)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000015)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x0000000F)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0xFFFFFEC6)
> >> > 19/07/2018 08:52:08 Enabling full-color cursor updates for client
> >> > 192.168.120.58
> >> > 19/07/2018 08:52:08 Enabling NewFBSize protocol extension for client
> >> > 192.168.120.58
> >> > 19/07/2018 08:52:08 Switching from ZRLE to raw Encoding for client
> >> > 192.168.120.58
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000018)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000016)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x00000015)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0x0000000F)
> >> > 19/07/2018 08:52:08 rfbProcessClientNormalMessage: ignoring
> >> > unsupported encoding type Enc(0xFFFFFEC6)
> >> > 19/07/2018 08:52:08 Enabling full-color cursor updates for client
> >> > 192.168.120.58
> >> > 19/07/2018 08:52:08 Enabling NewFBSize protocol extension for client
> >> > 192.168.120.58
> >> > 19/07/2018 08:52:08 Switching from raw to ZRLE Encoding for client
> >> > 192.168.120.58
> >> > 19/07/2018 08:52:08 Pixel format for client 192.168.120.58:
> >> > 19/07/2018 08:52:08   32 bpp, depth 24, little endian
> >> > 19/07/2018 08:52:08   true colour: max r 255 g 255 b 255, shift r 
> 16 g
> >> > 8 b 0
> >> > [ 6928.751385] aspeed-video 1e700000.video: disabling comp ready irq,
> >> > seq_ctrl[000500a8]
> >> > 19/07/2018 08:52:09 rfbProcessClientNormalMessage: read: Connection
> >> > reset by peer
> >> > 19/07/2018 08:52:09 Client 192.168.120.58 gone
> >> > 19/07/2018 08:52:09 Statistics             events Transmit/
> >> > RawEquiv ( saved)
> >> > 19/07/2018 08:52:09  FramebufferUpdate   :      3 | 0/        0 (
> >> 0.0%)
> >> > 19/07/2018 08:52:09  tight               :      1 | 30991/ 3145740
> >> > ( 99.0%)
> >> > 19/07/2018 08:52:09  raw                 :      1 | 16396/ 16396
> >> > (  0.0%)
> >> > 19/07/2018 08:52:09  ZRLE                :      2 | 62/ 3932160
> >> > (100.0%)
> >> > 19/07/2018 08:52:09  RichCursor          :      3 | 429/      429
> >> (  0.0%)
> >> > 19/07/2018 08:52:09  TOTALS              :     10 | 47878/ 7094725
> >> > ( 99.3%)
> >> > 19/07/2018 08:52:09 Statistics             events Received/
> >> > RawEquiv ( saved)
> >> > 19/07/2018 08:52:09  FramebufferUpdate   :      4 | 40/       40 (
> >> 0.0%)
> >> > 19/07/2018 08:52:09  SetPixelFormat      :      2 | 40/       40 (
> >> 0.0%)
> >> > 19/07/2018 08:52:09  SetEncodings        :      3 | 168/      168
> >> (  0.0%)
> >> > 19/07/2018 08:52:09  TOTALS              :      9 | 248/      248
> >> (  0.0%)
> >> >
> >> > What wrong with it?
> >> > BTW, vncview download from
> >> > https://www.realvnc.com/en/connect/download/viewer/linux/
> >> > I also got the same error using Tightvnc viewer
> >> > Thanks,
> >> > xiuzhi
> >> > Hi Eddie,
> >> >    My bmc is AST2400, I modified the aspeed-g4.dtsi(adding gfx:
> >> > display@1e6e6000  and  video: video@1e700000)
> >> >  and the aspeed-bmc-opp-xxx.dts (adding &video &vhub) .
> >> > An error occured when I executed the following instructions:
> >> >
> >> > root@zhaoxinc:~# create_usbhid.sh
> >> > root@zhaoxinc:~# obmc-ikvm -v /dev/video0 -i /dev/hidg0
> >> > [  125.586061] aspeed-video 1e700000.video: timed out on 1st mode
> >> detect
> >> > [  125.602732] aspeed-video 1e700000.video: Failed to start video
> >> engine
> >> > failed to open /dev/video0: 62 Timer expired
> >> > Need I modify drivers/media/platform/aspeed-video.c or any other
> >> files?
> >> >
> >> >  Thanks ,
> >> > Xiuzhi
> >> > On 07/31/2018 01:52 AM, xiuzhi wrote:
> >> > > Hi Alexander ,Eddie,
> >> > >   I merged the source from
> >> > > https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11500/,and
> >> > > kernel branch video-dev.
> >> > > How to test the video kvm feature by phosphor-webui or command 
> line?
> >> >
> >> > Hi,
> >> >
> >> > You need to make sure the video device is enabled in your device-tree
> >> > for the machine you use... My kernel patch enabled it for our AST2500
> >> > witherspoon system. If you're using AST2500 as well, then you just
> >> need
> >> > something like:
> >> >
> >> > &video {
> >> >      status = "okay";
> >> >      memory-region = <&gfx_memory>;
> >> > };
> >> >
> >> > And the virtual USB hub:
> >> > &vhub {
> >> >      status = "okay";
> >> > };
> >> >
> >> > If you're not using AST2500, you'll need more changes to device-tree.
> >> >
> >> > Then on the BMC command line:
> >> > create_usbhid.sh
> >> > obmc-ikvm -v /dev/video0 -i /dev/hidg0
> >> > And connect with any VNC client to port 0 of your BMC IP.
> >> >
> >> > Thanks,
> >> > Eddie
> >> >
> >> > > Best,
> >> > > xiuzhi
> >> > >
> >> > >
> >> > > ------------------ 原始邮件 ------------------
> >> > > *发件人:* "Alexander A. Filippov"<a.filippov@yadro.com>;
> >> > > *发送时间:* 2018年7月25日(星期三) 下午4:56
> >> > > *收件人:*
> >> > "openbmc"<openbmc@lists.ozlabs.org>;"xiuzhi"<1450335857@qq.com>;
> >> > > *主题:* Re: KVM Support?
> >> > >
> >> > > Hello everybody,
> >> > >
> >> > > Could you check the size of
> >> > >
> >> >
> >> 
> `build/tmp/deploy/image/<platformname>/fitImage-openbmc-phosphor-initramfs-*.bin`?
> >> > > If it exceeds 4456448 (0x440000) bytes, this is the problem
> >> described
> >> > > at https://github.com/openbmc/openbmc/issues/3314
> >> > >
> >> > >
> >> > > In this case you should modify flash partitions layout or trying to
> >> > > decrease kernel size.
> >> > >
> >> > > --
> >> > > Alexander
> >> > >
> >> > > On Wed, Jul 25, 2018 at 03:48:04PM +0800, xiuzhi wrote:
> >> > > > Hi Eddie,
> >> > > >
> >> > > >
> >> > > >   I read your KVM Support email on mailinglist.
> >> > > >
> >> > > >
> >> > > > I am going to port the BMC kvm to ast2400 . The u-boot can not
> >> load
> >> > > kernel ,the error message read:
> >> > > >
> >> > > >
> >> > > > ""U-Boot 2016.07 (Jul 23 2018 - 11:11:50 +0000)
> >> > > >
> >> > > >
> >> > > > DRAM:  240 MiB
> >> > > > WARNING: Caches not enabled
> >> > > > Flash: 32 MiB
> >> > > > *** Warning - bad CRC, using default environment
> >> > > >
> >> > > >
> >> > > > In:    serial
> >> > > > Out:   serial
> >> > > > Err:   serial
> >> > > > Net:   aspeednic#0
> >> > > > Error: aspeednic#0 address not set.
> >> > > >
> >> > > >
> >> > > > Hit any key to stop autoboot:  0
> >> > > > ## Loading kernel from FIT Image at 20080000 ...
> >> > > > Bad FIT kernel image format!
> >> > > > ERROR: can't get kernel image!
> >> > > > ast#
> >> > > >
> >> > > >
> >> > > > I added  config options to defconfig of ast2400 as follows:
> >> > > >
> >> > > >
> >> > > > CONFIG_MEDIA_SUPPORT=y
> >> > > > CONFIG_MEDIA_CAMERA_SUPPORT=y
> >> > > > CONFIG_MEDIA_SUPPORT=y
> >> > > > CONFIG_MEDIA_CAMERA_SUPPORT=y
> >> > > > # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> >> > > > # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> >> > > > # CONFIG_MEDIA_RADIO_SUPPORT is not set
> >> > > > # CONFIG_MEDIA_SDR_SUPPORT is not set
> >> > > > # CONFIG_MEDIA_CEC_SUPPORT is not set
> >> > > > # CONFIG_MEDIA_CONTROLLER is not set
> >> > > > CONFIG_RATIONAL=y
> >> > > > CONFIG_VIDEO_DEV=y
> >> > > > CONFIG_VIDEO_V4L2=y
> >> > > > CONFIG_V4L_PLATFORM_DRIVERS=y
> >> > > > CONFIG_VIDEO_ASPEED=y
> >> > > > CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
> >> > > >
> >> > > >
> >> > > > Need I modify the aspeed-bmc-opp-palmetto.dts and aspeed-g4.dtsi?
> >> > > >
> >> > > >
> >> > > > Can you give me the file list need to modify?
> >> > > >
> >> > > >
> >> > > > Thanks,
> >> > > >
> >> > > >
> >> > > > xiuzhi
> >
