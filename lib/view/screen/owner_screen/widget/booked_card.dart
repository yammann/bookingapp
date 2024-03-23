import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/data/model/apointment-model.dart';
import 'package:e_store/view/widget/user_detail_row.dart';
import 'package:flutter/material.dart';

class BookedCard extends StatelessWidget {
  const BookedCard({super.key, required this.appointmentModel, this.onTapIcon,});
final AppointmentModel appointmentModel;
final Function()? onTapIcon;
  @override
  Widget build(BuildContext context) {
    return  Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:appointmentModel.isBlocked?kWorrningSnackbar: kOnBoardingBG),
                child:  Column(
                  children: [
                     Row(
                      children: [
                        Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kOnBoardingP),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: appointmentModel.userProfImg!,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: 50, 
                          height: 50, 
                        ),
                      ),
                    ),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Column(
                            children: [
                              UserDetailesRow(
                                  title: "User Name", value: appointmentModel.userName!),
                              UserDetailesRow(
                                  title: "Time", value: "${appointmentModel.time.substring(0,6)} (${appointmentModel.duration} minute)"),
                              UserDetailesRow(title: "Detail", value: appointmentModel.detail!),
                            ],
                          ),
                        ),
                      ],
                    ),
                     IconButton(onPressed:appointmentModel.isBlocked?(){}: onTapIcon, icon: const Icon(Icons.cancel,color: Colors.red,size: 40,)),
                  ],
                ),
              );
  }
}