import 'dart:io';

void main(List<String> arguments) {
  // Check if there are command line arguments
  if (arguments.isEmpty) {
    print('Usage: dart totals.dart <inputFile.csv>');
    exit(1);
  }
  // Get the input file path from the command line arguments
  final inputFile = arguments.first;
  // Read all lines from the input CSV file
  final lines = File(inputFile).readAsLinesSync();
  // A map to store the total duration for each tag
  final totalDurationByTag = <String, double>{};
  // Remove the header line from the CSV file
  lines.removeAt(0);
  // Variable to store the total duration for all tags
  var totalDuration = 0.0;
  // Iterate through each line in the CSV file
  for (var line in lines) {
    final values = line.split(',');
    // Split the CSV line into values
    final durationStr = values[3].replaceAll('"', '');
    // Extract the duration and tag from the CSV values
    final duration = double.parse(durationStr);
    final tag = values[5].replaceAll('"', '');
    final previousTotal = totalDurationByTag[tag];
    // Update the total duration for the specific tag
    if (previousTotal == null) {
      totalDurationByTag[tag] = duration;
    } else {
      totalDurationByTag[tag] = previousTotal + duration;
    }
    // Update the overall total duration
    totalDuration += duration;
  }
  // Print the total duration for each tag
  for (var entry in totalDurationByTag.entries) {
    final durationFormatted = entry.value.toStringAsFixed(1);
    final tag = entry.key == '' ? 'Unallocate' : entry.key;
    print('${tag} : ${durationFormatted}h');
  }
  // Print the total duration for all tags
  print('\nTotal for all tags : ${totalDuration.toStringAsFixed(1)}h');
}
